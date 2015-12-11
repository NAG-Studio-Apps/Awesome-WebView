package me.ciwix.awesome_webview;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;

public class Offline extends Activity {

    private void localize(){
        TextView offline_headline = (TextView) findViewById(R.id.offline_headline);
        TextView offline_text     = (TextView) findViewById(R.id.offline_text);
        Button   offline_button   = (Button)   findViewById(R.id.offline_button);

        offline_headline.setText(Localization.OFFLINE_HEADLINE_TEXT);
        offline_text.setText(Localization.OFFLINE_TEXT_TEXT);
        offline_button.setText(Localization.OFFLINE_BUTTON_TEXT);
    }

    private void addClickListener(){
        Button btn = (Button) findViewById(R.id.offline_button);
        btn.setOnClickListener(new Button.OnClickListener(){
            public void onClick(View v){
                //Spawn WebContent.Java from here.
                //OnCreate will try to load the remote and otherwise
                //spawn this again
                new Spawner().spawnView(Offline.this, WebContent.class);
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        //Request the 'NoTitleBar' Layout
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);

        //Call onCreate event
        super.onCreate(savedInstanceState);

        //Add content
        setContentView(R.layout.activity_offline);

        //Create event listeners
        this.addClickListener();

        //Localize content
        this.localize();
    }
}
