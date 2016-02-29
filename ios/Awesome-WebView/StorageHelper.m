#import "StorageHelper.h"

@implementation StorageHelper

- (NSString *)getPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:@"storageHelper.plist"];
}

- (instancetype)load {
    self->storage = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithContentsOfFile:[self getPath]]];
    return self;
}

- (instancetype)save {
    [[[NSArray alloc] initWithArray:self->storage] writeToFile:[self getPath] atomically:YES];
    return self;
}

@end