//
//  ViewController.h
//  AwesomeWebview
//
//  Created by Lukas on 10/06/15.
//  Copyright (c) 2015 ciwix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *retryButton;

- (void) loadRequestedFromString : (NSString*) urlString;
@end

