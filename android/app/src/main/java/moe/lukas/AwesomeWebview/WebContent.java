package moe.lukas.AwesomeWebview;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.util.Log;
import android.webkit.CookieSyncManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/**
 * The WebContent view
 * <p/>
 * Shows the main content of this app
 */
public class WebContent extends Activity {

    WebView webview;

    /**
     * onCreate handler
     *
     * @param savedInstanceState
     * @see Offline::onCreate()
     */
    @SuppressLint("SetJavaScriptEnabled")
    @SuppressWarnings("deprecation")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        webview = (WebView) findViewById(R.id.webView);
        WebSettings settings = webview.getSettings();

        CookieSyncManager.createInstance(WebContent.this);

        settings.setJavaScriptEnabled(true);
        webview.setScrollBarStyle(WebView.SCROLLBARS_OUTSIDE_OVERLAY);
        webview.setScrollBarStyle(WebView.SCROLLBARS_OUTSIDE_OVERLAY);

        final ProgressDialog progress = ProgressDialog.show(WebContent.this, Localization.LOADING_SPINNER_HEADLINE, Localization.LOADING_SPINNER_TEXT);

        webview.setWebViewClient(new WebViewClient() {
            /**
             * Called every time the url changes
             * @param view
             * @param url
             * @return
             */
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                Log.i("WebContent", "Navigating to " + url);

                if (!progress.isShowing()) {
                    progress.show();
                }

                view.loadUrl(url);
                return true;
            }

            /**
             * Called when the page finished loading
             * @param view
             * @param url
             */
            public void onPageFinished(WebView view, String url) {
                Log.i("WebContent", "Finished loading of " + url);
                if (progress.isShowing()) {
                    progress.dismiss();
                }
            }

            /**
             * Called on ANY error regarding $view
             * @param view
             * @param errorCode
             * @param errorDescription
             * @param errorUrl
             */
            public void onReceivedError(WebView view, int errorCode, String errorDescription, String errorUrl) {
                Log.e("WebContent", "ERR AT   -> " + errorUrl);
                Log.e("WebContent", "ERR CODE -> " + errorCode);
                Log.e("WebContent", "ERR MSG  -> " + errorDescription);
                new Spawner().spawnView(WebContent.this, Offline.class); //TODO: Replace the offline-activity with an server-offline-activity
            }
        });

        if (new Network(this).isAvailable()) {
            webview.loadUrl(Settings.WEBVIEW_URI);
        } else {
            new Spawner().spawnView(WebContent.this, Offline.class);
        }
    }

    /**
     * onResume handler
     * <p/>
     * Starts the cookie sync on older androids
     */
    @SuppressWarnings("deprecation")
    @Override
    public void onResume() {
        super.onResume();
        CookieSyncManager.getInstance().startSync();
    }

    /**
     * onPause handler
     * <p/>
     * Stops the cookie sync on older androids
     */
    @SuppressWarnings("deprecation")
    @Override
    public void onPause() {
        super.onPause();
        CookieSyncManager.getInstance().stopSync();
    }

    /**
     * onBackPressed handler
     * <p/>
     * Goes back in history as long as the webview can go back.
     * After that, a exit dialog is spawned.
     * This simulates the native back-behaviour.
     */
    @Override
    public void onBackPressed() {
        if (webview.canGoBack()) {
            webview.goBack();
        } else {
            new Spawner().spawnExitDialog(WebContent.this);
        }
    }
}
