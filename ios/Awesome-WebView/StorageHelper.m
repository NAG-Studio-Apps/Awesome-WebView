#import "StorageHelper.h"

@implementation StorageHelper

#pragma mark - NSCoding

static NSString *const NotificationKey = @"ignoredNotifications";

+ (id)alloc {
    return [super alloc];
}

- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    // Init property
    self.ignoredNotifications = [[NSArray alloc] init];

    // Load data
    [self load];
    return self;
}

- (void)save {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self ignoredNotifications] forKey:NotificationKey];
    [defaults synchronize];
}

- (void)load {
    NSArray *data = [[NSUserDefaults standardUserDefaults] objectForKey:NotificationKey];

    if (data != nil) {
        self.ignoredNotifications = data;
    }
}

- (void)reset {
    self.ignoredNotifications = [[NSMutableArray alloc] init];
    [self save];
}

- (void)addValue:(id)value autoSave:(BOOL)save {
    NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray:[self ignoredNotifications]];
    [tmp addObject:value];
    self.ignoredNotifications = [[NSArray alloc] initWithArray:tmp];

    if (save) {
        [self save];
    }
}

@end