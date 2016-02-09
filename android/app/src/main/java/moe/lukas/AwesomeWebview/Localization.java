package moe.lukas.AwesomeWebview;

public class Localization {

    /**
     * Offline activity
     */
    public static String OFFLINE_HEADLINE_TEXT = "You seem to be offline";
    public static String OFFLINE_TEXT_TEXT = "Please check your connection and try again";
    public static String OFFLINE_BUTTON_TEXT = "Retry";


    /**
     * Loading spinner
     */
    public static String LOADING_SPINNER_HEADLINE = "";
    public static String LOADING_SPINNER_TEXT = "Loading...";


    /**
     * Exit dialog
     */
    public static String EXIT_DIALOG_HEADLINE = "Exit App ?";
    public static String EXIT_DIALOG_TEXT = "Do you want to close the App ?";

    //Use android.R.string values for Buttons [INT]
    public static int EXIT_DIALOG_BUTTON_POSITIVE = android.R.string.yes;
    public static int EXIT_DIALOG_BUTTON_NEGATIVE = android.R.string.no;

    //Use a custom string for Buttons
    //public static int EXIT_DIALOG_BUTTON_POSITIVE = "YEP";
    //public static int EXIT_DIALOG_BUTTON_NEGATIVE = "NOPE";

    //Use a value of android.R.drawable.* [INT]
    public static int EXIT_DIALOG_ICON = 0;

    //Use the custom icon [DRAWABLE]
    //public static Drawable EXIT_DIALOG_ICON = Drawable.createFromPath("/mycoolicon.foobar");

}
