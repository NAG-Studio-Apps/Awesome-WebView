package me.ciwix.awesome_webview;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;

public class Splash extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        new Handler().postDelayed(new Runnable(){
            @Override
            public void run(){
                new Spawner().spawnView(Splash.this, WebContent.class);
            }
        }, Customs.SPLASH_DISPLAY_LENGTH * 1000);
    }
}
