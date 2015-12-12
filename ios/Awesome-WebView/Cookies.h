//
//  Cookies.h
//  AwesomeWebview
//
//  Created by Lukas on 12/06/15.
//  Copyright (c) 2015 ciwix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cookies : NSObject

+ (void) cookieFactory: (NSString*)name value:(NSString*)value domain:(NSString*)domain origin:(NSString*)origin path:(NSString*)path version:(NSString*)version validFromNow:(int)validFromNow;
+ (void) printCookies;

@end
