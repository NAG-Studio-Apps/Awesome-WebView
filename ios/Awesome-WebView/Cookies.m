#import "Cookies.h"

@implementation Cookies

+ (void) cookieFactory: (NSString*)name value:(NSString*)value domain:(NSString*)domain
                origin:(NSString*)origin path:(NSString*)path version:(NSString*)version validFromNow:(int)validFromNow {
    //Force the CookieAcceptPolicy to 'Always'
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    //Create the cookie dough
    NSMutableDictionary *dough = [NSMutableDictionary dictionary];
    dough[NSHTTPCookieName] = name;
    dough[NSHTTPCookieValue] = value;
    dough[NSHTTPCookieDomain] = domain;
    dough[NSHTTPCookieOriginURL] = origin;
    dough[NSHTTPCookiePath] = path;
    dough[NSHTTPCookieVersion] = version;
    dough[NSHTTPCookieExpires] = [[NSDate date] dateByAddingTimeInterval:(NSTimeInterval) validFromNow];
    
    //Bake the cookie
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:dough];
    
    //Eat the cookie
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}

+ (void) printCookies {
    /*
     *  The 1 in "!!!1!" is not a typo
     *  Read knowyourmeme.com/memes/the-1-phenomenon
     */
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    NSLog(@"Printing all saved cookies!!!1!");
    NSLog(@"=================================================");
    
    for(cookie in [cookieJar cookies]){
        NSLog(@"%@", cookie);
    }
        
    NSLog(@"=================================================");
}

@end
