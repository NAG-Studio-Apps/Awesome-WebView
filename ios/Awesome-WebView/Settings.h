#include <powerdefines/powerdefines.h>

#ifndef SWITCH
    #define SWITCH PD_SWITCH
#endif

#ifndef CASE
    #define CASE PD_CASE
#endif

#ifndef Globals_h
    #define Globals_h

    // The statusbar color
    #define STATUSBAR_COLOR 0xFFFFFF

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
    // Expects this format:
    /**
     * {
     *     "notifications": [
     *         {
     *             "uid": 28   // The UID is stored locally so that every notification is only shown one time
     *             "title": "Cool Title!",
     *             "message": "Click here to see more!"
     *         },
     *         ...
     *     ]
     * }
     */
    #define PUSH_API_URL @"http://api.yoursite.com/v1/get-notifications"

    // How often to fetch notifications (seconds)
    // Note that this is only a suggestion to ios and the interval could actually be longer or shorter
    #define BACKGROUND_FETCH_INTERVAL 240
#endif