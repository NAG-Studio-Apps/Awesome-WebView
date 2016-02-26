package moe.lukas.AwesomeWebview;

import android.app.IntentService;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Handler;
import android.util.Log;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PushService extends IntentService {
    /**
     * This class is executed every time the app checks for new notifications
     */
    @SuppressWarnings("deprecation")
    private class APIHelper extends AsyncTask<List<NameValuePair>, Void, String> {

        private String TAG = "PUSH/API-HELPER";

        /**
         * Gets called by AsyncTask after creation
         */
        @SafeVarargs
        protected final String doInBackground(List<NameValuePair>... params) {
            try {
                Log.i(TAG, "APIHelper was started! (doInBackground was called)");

                // Prepare HTTP client
                DefaultHttpClient httpClient = new DefaultHttpClient();
                HttpEntity httpEntity;
                HttpResponse httpResponse;
                HttpGet httpGet = new HttpGet(Settings.PUSH_NOTIFICATIONS_ENDPOINT);

                // execute the request
                httpResponse = httpClient.execute(httpGet);
                httpEntity = httpResponse.getEntity();

                return EntityUtils.toString(httpEntity);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        /**
         * Gets called after doInBackground finishes
         */
        protected void onPostExecute(String response) {
            try {
                //Parse HTTP response
                JSONObject jsonObject = new JSONObject(response);
                JSONArray notifications = jsonObject.getJSONArray("notifications");

                // Get show notifications
                SharedPreferences storage = getSharedPreferences("IGNORED_NOTIFICATIONS", 0);
                Set<String> ignoredNotifications = storage.getStringSet("notifications", new HashSet<>(Arrays.asList(new String[]{})));

                //Loop through notifications
                for (int i = 0; i < notifications.length(); i++) {
                    JSONObject push = notifications.getJSONObject(i);
                    int id = push.getInt("uid");

                    if (!ignoredNotifications.contains(Integer.toString(id))) {
                        String title = push.getString("title");
                        String message = push.getString("message");

                        Log.i(TAG, "Notification " + id + ": [" + title + "]" + "[" + message + "]");

                        //Create and display the notification
                        PushNotification.notify(PushService.this, title, message, id);

                        // Save the notification as 'ignored'
                        ignoredNotifications.add(Integer.toString(id));

                        SharedPreferences.Editor editor = storage.edit();
                        editor.putStringSet("notifications", ignoredNotifications);
                        editor.apply();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            //Re-execute after $pollInterval
            createApiHelper(Settings.PUSH_NOTIFICATIONS_POLL_INTERVAL);
        }
    }

    //Constructor
    public PushService() {
        super("PUSH-WORKER");
    }

    public PushService(String name) {
        super(name);
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        Log.i(TAG, "onHandleIntent()");
        createApiHelper(Settings.PUSH_NOTIFICATIONS_INITIAL_POLL_INTERVAL);
    }

    private Handler mHandler = new Handler();
    protected final String TAG = "PUSH";

    private void createApiHelper(int afterInterval) {
        Log.i(TAG, "Creating a new APIHelper after " + afterInterval / 1000 + " seconds");
        mHandler.postDelayed(new Runnable() {
            @SuppressWarnings("unchecked")
            @Override
            public void run() {
                new APIHelper().execute();
            }
        }, afterInterval);
    }
}
