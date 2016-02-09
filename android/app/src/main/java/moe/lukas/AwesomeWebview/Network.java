package moe.lukas.AwesomeWebview;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/**
 * A class for detecting network states
 */
public class Network {
    /**
     * The context we're working with
     */
    Context mContext;

    /**
     * Constructor
     * <p/>
     * Sets the context
     *
     * @param mContext
     */
    public Network(Context mContext) {
        this.mContext = mContext;
    }

    /**
     * Checks if a internet connection is available
     *
     * @return boolean
     */
    public boolean isAvailable() {
        ConnectivityManager cm = (ConnectivityManager) mContext.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo ni = cm.getActiveNetworkInfo();
        return ni != null && ni.isConnected();
    }

}
