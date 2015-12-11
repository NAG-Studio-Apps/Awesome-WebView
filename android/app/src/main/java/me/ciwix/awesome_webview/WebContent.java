package me.ciwix.awesome_webview;

import android.app.Activity;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.util.Log;
import android.webkit.CookieSyncManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class WebContent extends Activity {

    WebView webview;

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

        webview.setWebViewClient(new WebViewClient(){

            public boolean shouldOverrideUrlLoading(WebView view, String url){
                Log.i("WebContent", "Navigating to " + url);

                if(!progress.isShowing()){
                    progress.show();
                }

                view.loadUrl(url);
                return true;
            }

            public void onPageFinished(WebView view, String url){
                Log.i("WebContent", "Finished loading of " + url);
                if(progress.isShowing()) {
                    progress.dismiss();
                }
            }

            public void onReceivedError(WebView view, int errorCode, String errorDescription, String errorUrl){
                Log.e("WebContent", "ERR AT   -> " + errorUrl);
                Log.e("WebContent", "ERR CODE -> " + errorCode);
                Log.e("WebContent", "ERR MSG  -> " + errorDescription);
                new Spawner().spawnView(WebContent.this, Offline.class); //TODO: Replace the offline-activity with an server-offline-activity
            }
        });

        if(new Network(this).isAvaiable()){
            webview.loadUrl(Customs.WEBVIEW_URI);
        }else{
            new Spawner().spawnView(WebContent.this, Offline.class);
        }
    }

    @Override
    public void onResume(){
        super.onResume();
        CookieSyncManager.getInstance().startSync();
    }

    @Override
    public void onPause(){
        super.onPause();
        CookieSyncManager.getInstance().stopSync();
    }

    @Override
    public void onBackPressed(){
        if(webview.canGoBack()){
            webview.goBack();
        }else{
            new Spawner().spawnExitDialog(WebContent.this);
        }
    }
}
