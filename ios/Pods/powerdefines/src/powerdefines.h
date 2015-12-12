// The MIT License (MIT)
//
// Copyright (c) 2015 Lukas B.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Indent: 4 Spaces
//

//System version tools
#define PD_SYSTEM_VERSION_EQUAL_TO(v)                  	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define PD_SYSTEM_VERSION_GREATER_THAN(v)              	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define PD_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define PD_SYSTEM_VERSION_LESS_THAN(v)                 	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define PD_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
 
//Check the device type
#define PD_DEVICE_IS_IPAD   							(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define PD_DEVICE_IS_IPHONE 							(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//Chek if device has a retina screen
#define PD_DEVICE_HAS_RETINA_SCREEN 					([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] >= 2)

//Check if the device supports multitasking
#define PD_DEVICE_SUPPORTS_MULTITASKING 				([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)] && [[UIDevice currentDevice] isMultitaskingSupported])

//Switch/Case strings
#define PD_CASE(str)                       				if ([__s__ isEqualToString:(str)])
#define PD_SWITCH(s)                       				for (NSString *__s__ = (s); ; )
#define PD_DEFAULT

//Ivalidates and nils a given timer
#define PD_INVALIDATE_TIMER(t) 							[t invalidate]; t = nil;

//Define colors with ease!
#define PD_COLOR_RGBA(r,g,b,a)							[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define PD_COLOR_RGB(r,g,b)								PD_RGBA(r, g, b, 1.0f)
#define PD_COLOR_HEX(c)                         		[UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0];

//Access the delegate
#define PD_APP_DELEGATE			               			((AppDelegate *)[[UIApplication sharedApplication] delegate])

//PD_LOG is like NSLog() but shows more informations
#ifdef DEBUG
	#define PD_LOG( s, ... ) 							NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
	#define PD_LOG( s, ... )
#endif

//Log the bounds a given view
#define PD_LOG_BOUNDS(view) 							UA_log(@"%@ bounds: %@", view, NSStringFromRect([view bounds]))

//log the frame of a given view
#define PD_LOG_FRAME(view)  							UA_log(@"%@ frame: %@", view, NSStringFromRect([view frame]))

//Cast BOOL to NSString
#define PD_BOOL_TO_STRING(b) 							(b ? @"YES" : @"NO")

//Some shortcuts to get common objects/values/...
#define PD_GET_USER_DEFAULTS	            			[NSUserDefaults standardUserDefaults]
#define PD_GET_NOTIFICATION_CENTER		     			[NSNotificationCenter defaultCenter]
#define PD_GET_SHARED_APPLICATION             			[UIApplication sharedApplication]
#define PD_GET_MAIN_BUNDLE                    			[NSBundle mainBundle]
#define PD_GET_MAIN_SCREEN                     			[UIScreen mainScreen]
#define PD_GET_NAVBAR	                                self.navigationController.navigationBar
#define PD_GET_NAVBAR_HEIGHT                            self.navigationController.navigationBar.bounds.size.height
#define PD_GET_TABBAR                              		self.tabBarController.tabBar
#define PD_GET_TABBAR_HEIGTH			                self.tabBarController.tabBar.bounds.size.height
#define PD_GET_SCREEN_WIDTH			                    [[UIScreen mainScreen] bounds].size.width
#define PD_GET_SCREEN_HEIGHT	                        [[UIScreen mainScreen] bounds].size.height
#define PD_GET_VIEW_WIDTH(v)                        	v.frame.size.width
#define PD_GET_VIEW_HEIGHT(v)                       	v.frame.size.height
#define PD_GET_VIEW_X(v)                            	v.frame.origin.x
#define PD_GET_VIEW_Y(v)                            	v.frame.origin.y
#define PD_GET_SELF_VIEW_WIDTH                       	self.view.bounds.size.width
#define PD_GET_SELF_VIEW_HEIGHT		                    self.view.bounds.size.height
#define PD_GET_RECT_X(f)                            	f.origin.x
#define PD_GET_RECT_Y(f)                            	f.origin.y
#define PD_GET_RECT_WIDTH(f)                        	f.size.width
#define PD_GET_RECT_HEIGHT(f)		                    f.size.height

//Some shortcutes to set common objects/values/..
#define PD_SET_RECT_WIDTH(f, w)			                CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define PD_SET_RECT_HEIGHT(f, h)                 		CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define PD_SET_RECT_X(f, x)                      		CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define PD_SET_RECT_Y(f, y)                      		CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define PD_SET_RECT_SIZE(f, w, h)                		CGRectMake(RectX(f), RectY(f), w, h)
#define PD_SET_RECT_ORIGIN(f, x, y)              		CGRectMake(x, y, RectWidth(f), RectHeight(f))

//Some little helpers
#define PD_DATE_COMPONENTS                     			NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define PD_TIME_COMPONENTS                     			NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define PD_FLUSH_POOL(p)                       			[p drain]; p = [[NSAutoreleasePool alloc] init]

//Manipulate the network-activity-indicator
#define PD_NETWORK_ACTIVITY_INDICATIOR_SHOW()  			[UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define PD_NETWORK_ACTIVITY_INDICATIOR_HIDE()      		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define PD_NETWORK_ACTIVITY_INDICATIOR_VISIBLE(x)  		[UIApplication sharedApplication].networkActivityIndicatorVisible = x

//Forces the function to run on the main thread
//Currently only works for functions without arguments
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#define PD_RUN_ON_MAIN_THREAD							if (![NSThread isMainThread]) { dispatch_sync(dispatch_get_main_queue(), ^{ [self performSelector:_cmd]; }); return; };
#pragma clang diagnostic pop