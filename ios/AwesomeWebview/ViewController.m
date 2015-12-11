//
//  ViewController.m
//  AwesomeWebview
//
//  Created by Lukas on 10/06/15.
//  Copyright (c) 2015 ciwix. All rights reserved.
//
#import <Foundation/NSURLError.h>

#import "ViewController.h"
#import "Connectivity.h"
#import "Cookies.h"

#import <MBProgressHUD.h>

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//Set your custom values here

///WebView Settings
//The URI our WebView will show
NSString *view_uri = @"http://google.com";

//Show the "Bounce" effect when scrolling?
BOOL WEBVIEW_BOUNCE_ACTIVE = YES;

//Show the 'Loading'-Spinner
BOOL SPINNER_VISIBLE = YES;

///Translations
//The text under the 'Loading'-Spinner
NSString *SPINNER_LOADING_TEXT = @"Loading...";

///Console Settings
//Show debug messages from Connectivity.m ?
BOOL SHOW_CONNECTIVITY_DEBUG_MSG = NO;

//Show debug messages from WebView ?
BOOL SHOW_WEBVIEW_DEBUG_MSG = NO;


//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Init some globals
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.webView.scrollView.bounces = WEBVIEW_BOUNCE_ACTIVE;
    NSLog(@"[View] ~viewDidLoad");
    
    //View loaded, let's check the internet connection
    NSMutableString *msg = [NSMutableString string];
    [msg appendString:@"[MAIN] Loading '"];
    [msg appendString:view_uri];
    [msg appendString:@"' in [_webView]"];
    NSLog(msg);
    
    //Load global uri in webview
    [self loadRequestedFromString:view_uri];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"[MAIN][CRITICAL] THE DEVICE IS RUNNING OUT OF MEMORY!!!");
    // Dispose of any resources that can be recreated.
}

- (void) loadRequestedFromString:(NSString*)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    if (SHOW_WEBVIEW_DEBUG_MSG){
        NSLog(@"[_webView] ~loadRequestedFromString");
    }
}

- (void) webViewDidStartLoad:(UIWebView *)webView{
    if(SPINNER_VISIBLE){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = SPINNER_LOADING_TEXT;
    }
    
    if (SHOW_WEBVIEW_DEBUG_MSG){
        NSLog(@"[_webView] ~didStartLoad");
    }
}

- (void) webViewDidFinishLoad:(UIWebView *)webView{
    if (SPINNER_VISIBLE) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    if (SHOW_WEBVIEW_DEBUG_MSG){
        NSMutableString *msg = [NSMutableString string];
        [msg appendString:@"[_webView] ~didFinishLoad | "];
        [msg appendString:@"New URL -> "];
        [msg appendString:_webView.request.URL.absoluteString];
        NSLog(msg);
    }
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if(SPINNER_VISIBLE){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    
    NSString *err = [error localizedDescription];
    NSLog(@"[_webView] Reported this error:");
    NSLog(err);
    
    [self showNoInetScreen];
    
    //TODO: catch errors with this switch and show other error screens
    /*
     if ([error.domain isEqualToString:NSURLErrorDomain]){
     switch (error.code){
     case NSURLErrorBadURL:
     //Redirect to bad url
     break;
     
     case NSURLErrorBadServerResponse:
     //Bad server data received
     break;
     
     case NSURLErrorCannotConnectToHost:
     //Cannot connect to Host
     break;
     
     case NSURLErrorCannotFindHost:
     //URL cannot be resolved
     break;
     
     case NSURLErrorDataNotAllowed:
     //Carrier blocks internet connection
     [self showNoInetScreen];
     break;
     
     case NSURLErrorNotConnectedToInternet:
     //The Internet connection got lost
     [self showNoInetScreen];
     break;
     }
     }
     */
}

- (void) showNoInetScreen {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = (ViewController *)
    [sb instantiateViewControllerWithIdentifier:@"ErrorView"];
    [self presentViewController:vc animated:YES completion:nil];
    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (IBAction)handleButtonClick:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = (ViewController *)
    [sb instantiateViewControllerWithIdentifier:@"MainView"];
    [self presentViewController:vc animated:YES completion:nil];
}
@end