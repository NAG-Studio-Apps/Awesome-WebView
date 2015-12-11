package me.ciwix.awesome_webview;

import android.webkit.CookieManager;

public class Cookie {

    public static void inject(String url, String value){
        CookieManager.getInstance().setCookie(url, value);
    }

}
