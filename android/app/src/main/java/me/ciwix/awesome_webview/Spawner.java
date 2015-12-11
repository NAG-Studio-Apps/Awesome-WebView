package me.ciwix.awesome_webview;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;

public class Spawner {

    public void spawnView(Context _old, Class _new){
        Intent mainIntent = new Intent(_old, _new);
        mainIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        _old.startActivity(mainIntent);
        ((Activity) _old).finish();
    }

    public void spawnExitDialog(Context context){
        AlertDialog.Builder builder = new AlertDialog.Builder(context);

        builder.setTitle(Localization.EXIT_DIALOG_HEADLINE);
        builder.setMessage(Localization.EXIT_DIALOG_TEXT);
        builder.setPositiveButton(Localization.EXIT_DIALOG_BUTTON_POSITIVE, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
                System.exit(0);
            }
        });
        builder.setNegativeButton(Localization.EXIT_DIALOG_BUTTON_NEGATIVE, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        builder.setIcon(Localization.EXIT_DIALOG_ICON);
        builder.show();
    }

}
