#import <Foundation/Foundation.h>

@interface StorageHelper : NSObject {
@public
    NSMutableArray *storage;
}

- (instancetype)save;

- (instancetype)load;

@end