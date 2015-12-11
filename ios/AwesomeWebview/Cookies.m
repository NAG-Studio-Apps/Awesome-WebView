//
//  Cookies.m
//  AwesomeWebview
//
//  Created by Lukas on 12/06/15.
//  Copyright (c) 2015 ciwix. All rights reserved.
//

#import "Cookies.h"

@implementation Cookies

+ (void) cookieFactory: (NSString*)name value:(NSString*)value domain:(NSString*)domain
                origin:(NSString*)origin path:(NSString*)path version:(NSString*)version validFromNow:(int)validFromNow {
    //Force the CookieAcceptPolicy to 'Always'
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    //Create the cookie dough
    NSMutableDictionary *dough = [NSMutableDictionary dictionary];
    [dough setObject:name forKey:NSHTTPCookieName];
    [dough setObject:value forKey:NSHTTPCookieValue];
    [dough setObject:domain forKey:NSHTTPCookieDomain];
    [dough setObject:origin forKey:NSHTTPCookieOriginURL];
    [dough setObject:path forKey:NSHTTPCookiePath];
    [dough setObject:version forKey:NSHTTPCookieVersion];
    [dough setObject:[[NSDate date] dateByAddingTimeInterval:(NSTimeInterval) validFromNow] forKey:NSHTTPCookieExpires];
    
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
