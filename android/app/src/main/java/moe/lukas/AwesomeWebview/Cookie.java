package moe.lukas.AwesomeWebview;

import android.webkit.CookieManager;

/**
 * A class that handles/manages/... cookies
 */
public class Cookie {

    /**
     * Inject a cookie into the webview
     *
     * @param url
     * @param value
     */
    public static void inject(String url, String value) {
        CookieManager.getInstance().setCookie(url, value);
    }

}
