package moe.lukas.AwesomeWebview;

import android.graphics.Color;
import android.view.View;

public class Settings {

    /**
     * Splash
     */
    // How long the splash will display in seconds
    public static final int SPLASH_DISPLAY_LENGTH = 3;

    /**
     * WebView
     */
    // The url to display
    public static final String WEBVIEW_URI = "http://google.com";

    // Enable/Disable JavaScript in the WebView
    public static final boolean JAVASCRIPT_ENABLED = true;

    //Show horizontal scrollbar?
    public static final boolean SCROLLBAR_HORIZONTAL_VISIBLE = false;

    //Show vertical scrollbar?
    public static final boolean SCROLLBAR_VERTICAL_VISIBLE = false;

    //Show overscroll gradient?
    public static final int WEBVIEW_OVERSCROLL_MODE = View.OVER_SCROLL_NEVER;

    /**
     * Push Notifications
     */
    // Whether to enable notifications or not
    public static final boolean PUSH_NOTIFICATIONS_ENABLED = false;

    // How often to check for new notifications (in minutes)
    public static final int PUSH_NOTIFICATIONS_POLL_INTERVAL = 10 * 60 * 1000;

    // How long to wait to check for notifications after the app was launched (seconds)
    public static final int PUSH_NOTIFICATIONS_INITIAL_POLL_INTERVAL = 5 * 1000;

    // The endpoint where the Push JSON is located
    public static final String PUSH_NOTIFICATIONS_ENDPOINT = "http://push.loc.192.168.130.126.xip.io/wp-json/gg_push/v1/notifications";

    // An array of vibration durations
    public static final long[] PUSH_NOTIFICATIONS_VIBRATE_PATTERN = new long[]{250,250,250};

    // The color of the notification led
    public static final int PUSH_NOTIFICATIONS_LED_COLOR = Color.BLUE;

    // The patern how the notification led will flash [TIME_ACTIVE, TIME_INACTIVE]
    public static final int[] PUSH_NOTIFICATIONS_LED_PATTERN = new int[]{600,2000};

    // The icon shown in all notifications
    public static final int PUSH_NOTIFICATIONS_ICON = R.drawable.radio;
}