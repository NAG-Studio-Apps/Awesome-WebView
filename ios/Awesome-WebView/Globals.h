#include <powerdefines/powerdefines.h>

#ifndef switch
#define switch PD_SWITCH
#endif

#ifndef case
#define case PD_CASE
#endif

#ifndef Globals_h
#define Globals_h

//The URI our WebView will show
#define VIEW_URI @"http://google.com"

//Show the "Bounce" effect when scrolling?
#define WEBVIEW_BOUNCE_ACTIVE YES

//Show the 'Loading'-Spinner?
#define SPINNER_VISIBLE YES

//The text shown under the 'Loading'-Spinner
#define SPINNER_LOADING_TEXT @"Loading..."

//Show debug messages from Connectivity.m ?
#define SHOW_CONNECTIVITY_DEBUG_MSG NO

//Show debug messages from WebView ?
#define SHOW_WEBVIEW_DEBUG_MSG NO

#endif