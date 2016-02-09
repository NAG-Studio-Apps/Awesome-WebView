#import <Foundation/Foundation.h>

@interface Cookies : NSObject

+ (void) cookieFactory: (NSString*)name value:(NSString*)value domain:(NSString*)domain origin:(NSString*)origin path:(NSString*)path version:(NSString*)version validFromNow:(int)validFromNow;
+ (void) printCookies;

@end
