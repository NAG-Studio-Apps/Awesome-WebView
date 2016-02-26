package moe.lukas.AwesomeWebview;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.support.v4.app.NotificationCompat;

public class PushNotification {

    private static String NOTIFICATION_TAG = null;

    /**
     * Creates and displays a push notification
     */
    public static void notify(final Context context, String title, String text, int id) {
        NOTIFICATION_TAG = Integer.toString(id);

        //Build the notification
        final NotificationCompat.Builder builder = new NotificationCompat.Builder(context)
                .setDefaults(Notification.DEFAULT_ALL)
                .setSmallIcon(Settings.PUSH_NOTIFICATIONS_ICON)
                .setContentTitle(title)
                .setContentText(text)
                .setTicker(text)
                .setContentIntent(
                        PendingIntent.getActivity(
                                context,
                                0,
                                new Intent(context, WebContent.class),
                                PendingIntent.FLAG_UPDATE_CURRENT
                        )
                )
                .setAutoCancel(true)
                .setVibrate(Settings.PUSH_NOTIFICATIONS_VIBRATE_PATTERN)
                .setLights(
                        Settings.PUSH_NOTIFICATIONS_LED_COLOR,
                        Settings.PUSH_NOTIFICATIONS_LED_PATTERN[0],
                        Settings.PUSH_NOTIFICATIONS_LED_PATTERN[1]
                );

        notify(context, builder.build());


    }

    private static void notify(final Context context, final Notification notification) {
        final NotificationManager nm = (NotificationManager) context
                .getSystemService(Context.NOTIFICATION_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ECLAIR) {
            nm.notify(NOTIFICATION_TAG, 0, notification);
        } else {
            nm.notify(NOTIFICATION_TAG.hashCode(), notification);
        }
    }

    /**
     * On eclair we >can< cancel a notification
     */
    @TargetApi(Build.VERSION_CODES.ECLAIR)
    public static void cancel(final Context context) {
        final NotificationManager nm = (NotificationManager) context
                .getSystemService(Context.NOTIFICATION_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ECLAIR) {
            nm.cancel(NOTIFICATION_TAG, 0);
        } else {
            nm.cancel(NOTIFICATION_TAG.hashCode());
        }
    }
}