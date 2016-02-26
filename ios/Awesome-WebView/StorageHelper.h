//
// Created by Lukas Breuer on 26/02/16.
// Copyright (c) 2016 ciwix. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface StorageHelper : NSObject

@property NSArray *ignoredNotifications;

- (void)save;

- (void)load;

- (void)reset;

- (void)addValue:(id)value autoSave:(BOOL)save;
@end