#import <Foundation/NSURLError.h>
#import <MBProgressHUD.h>
#import <YYHRequest/YYHRequest.h>

#import "Settings.h"
#import "ViewController.h"
#import "StorageHelper.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Init some globals
    _webView.scalesPageToFit = YES;
    _webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _webView.scrollView.bounces = WEBVIEW_BOUNCE_ACTIVE;
    _webView.scrollView.showsHorizontalScrollIndicator = SCROLLBAR_HORIZONTAL_VISIBLE;
    _webView.scrollView.showsVerticalScrollIndicator = SCROLLBAR_VERTICAL_VISIBLE;

    NSLog(@"[View] ~viewDidLoad");

    if (PD_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [self setNeedsStatusBarAppearanceUpdate];
        UIView *sbview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        sbview.backgroundColor = PD_COLOR_HEX(STATUSBAR_COLOR);
        [self.view addSubview:sbview];
    }

    //Load global uri in webview
    [self loadRequestedFromString:VIEW_URI];
}

- (void)viewWillAppear:(BOOL)animated {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadRequestedFromString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    _webView.delegate = self;
    [_webView loadRequest:urlRequest];

    if (SHOW_WEBVIEW_DEBUG_MSG) {
        NSLog(@"[_webView] ~loadRequestedFromString");
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if (SPINNER_VISIBLE) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = SPINNER_LOADING_TEXT;
    }

    if (SHOW_WEBVIEW_DEBUG_MSG) {
        NSLog(@"[_webView] ~didStartLoad");
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (SPINNER_VISIBLE) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }

    if (SHOW_WEBVIEW_DEBUG_MSG) {
        NSLog(@"[_webView] didFinishLoad of %@", [_webView.request.URL absoluteString]);
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if (SPINNER_VISIBLE) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }

    NSLog(@"webView caught error %D while loading url %@", error.code, [_webView.request.URL absoluteString]);

    switch ([error code]) {
        //Ignored errors
        case 101:
        case 102:
        case -1002:
        case NSURLErrorCancelled:
            return;

        default:
            [_webView stopLoading];

            NSString *err = [error localizedDescription];
            NSInteger errc = error.code;
            NSLog(@"[_webView] Reported this uncatched error %@ [Code %D]", err, errc);

            [self showNoInetScreen];
            break;
    }
}

- (void)showNoInetScreen {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = (ViewController *) [sb instantiateViewControllerWithIdentifier:@"ErrorView"];
    [self presentViewController:vc animated:YES completion:nil];
    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (IBAction)handleButtonClick:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = (ViewController *)
            [sb instantiateViewControllerWithIdentifier:@"MainView"];
    [self presentViewController:vc animated:YES completion:nil];
}

/**
 * Forces portrait orientation by spoofing the supported orientations
 *
 * @return NSUInteger
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

/**
 * Forces portrait orientation in presentation mode
 *
 * @return UIInterfaceOrientation
 */
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

/**
 * Runs in the background to fetch and display push-notifications
 *
 * @see AppDelegate::performFetchWithCompletionHandler
 */
- (void)fetchNewDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    YYHRequest *request = [YYHRequest requestWithURL:[NSURL URLWithString:PUSH_API_URL]];
    request.method = @"GET";
    request.headers[@"Accept"] = @"application/json";

    [request onSuccess:^(NSData *data) {
        NSLog(@"Successfully fetched notifications!");

        NSMutableDictionary *notifications = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil][@"notifications"];
        StorageHelper *storageHelper = [[[StorageHelper alloc] init] load];
        int badgeNo = (int) [UIApplication sharedApplication].applicationIconBadgeNumber;

        for (NSDictionary *push in notifications) {
            if (![storageHelper->storage containsObject:push[@"uid"]]) {
                NSLog(@"Showing notification %@", push[@"uid"]);

                UILocalNotification *localNotification = [[UILocalNotification alloc] init];
                NSDate *now = [NSDate date];
                NSDate *dateToFire = [now dateByAddingTimeInterval:5];

                localNotification.fireDate = dateToFire;
                localNotification.alertTitle = push[@"title"];
                localNotification.alertBody = push[@"message"];
                localNotification.soundName = UILocalNotificationDefaultSoundName;
                localNotification.applicationIconBadgeNumber = ++badgeNo;
                localNotification.userInfo = @{@"DUMMY" : @"STUB!"};

                // Show notification
                [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

                // Save UID
                [storageHelper->storage addObject:push[@"uid"]];
                [storageHelper save];
            } else {
                NSLog(@"Ignoring notification %@", push[@"uid"]);
            }
        }

        completionHandler(UIBackgroundFetchResultNewData);
    }];

    [request onFailure:^(NSError *error) {
        completionHandler(UIBackgroundFetchResultFailed);
        NSLog(@"Tried to fetch notifications, but got this error: %@", error.description);
    }];

    [request loadRequest];
}
@end