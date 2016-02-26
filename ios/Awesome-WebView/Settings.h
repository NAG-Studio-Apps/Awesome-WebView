#include <powerdefines/powerdefines.h>

#ifndef SWITCH
    #define SWITCH PD_SWITCH
#endif

#ifndef CASE
    #define CASE PD_CASE
#endif

#ifndef Globals_h
    #define Globals_h

    // The URI our WebView will show
    #define VIEW_URI @"http://google.com"

    // Show the "Bounce" effect when scrolling?
    #define WEBVIEW_BOUNCE_ACTIVE YES

    // Show/hide the scrollbars
    #define SCROLLBAR_HORIZONTAL_VISIBLE NO
    #define SCROLLBAR_VERTICAL_VISIBLE NO

    // Show the 'Loading'-Spinner?
    #define SPINNER_VISIBLE YES

    // The text shown under the 'Loading'-Spinner
    #define SPINNER_LOADING_TEXT @"Loading..."

    // Show debug messages from Connectivity.m ?
    #define SHOW_CONNECTIVITY_DEBUG_MSG NO

    // Show debug messages from WebView ?
    #define SHOW_WEBVIEW_DEBUG_MSG NO

    // Enable push-notifications?
    #define ENABLE_PUSH_NOTIFICATIONS NO

    // The url to get the notifications from
    #define PUSH_API_URL @"http://push.loc.192.168.130.126.xip.io/wp-json/gg_push/v1/notifications"

    // How often to fetch notification (seconds)
    #define BACKGROUND_FETCH_INTERVAL 15
#endif