package moe.lukas.AwesomeWebview;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;

/**
 * The offline view
 *
 * Spawned when there is no internet connection
 */
public class Offline extends Activity {

    /**
     * Localizes entities by loading the Localization class
     */
    private void localize() {
        TextView offline_headline = (TextView) findViewById(R.id.offline_headline);
        TextView offline_text = (TextView) findViewById(R.id.offline_text);
        Button offline_button = (Button) findViewById(R.id.offline_button);

        offline_headline.setText(Localization.OFFLINE_HEADLINE_TEXT);
        offline_text.setText(Localization.OFFLINE_TEXT_TEXT);
        offline_button.setText(Localization.OFFLINE_BUTTON_TEXT);
    }

    /**
     * Adds a click listener on the "retry" button
     */
    private void addClickListener() {
        Button btn = (Button) findViewById(R.id.offline_button);
        btn.setOnClickListener(new Button.OnClickListener() {
            public void onClick(View v) {
                /**
                 * Spawns the class WebContent
                 *
                 * On Error WebContent will spawn the class Offline and so on.
                 * This cycle continues until WebContent successfully connects to the web.
                 */
                new Spawner().spawnView(Offline.this, WebContent.class);
            }
        });
    }

    /**
     * onCreate handler
     *
     * You can think of this function like a main() for this view
     * @param savedInstanceState
     */
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
