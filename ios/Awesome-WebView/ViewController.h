#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property(weak, nonatomic) IBOutlet UIWebView *webView;
@property(weak, nonatomic) IBOutlet UIButton *retryButton;

- (void)loadRequestedFromString:(NSString *)urlString;

- (void)fetchNewDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end

