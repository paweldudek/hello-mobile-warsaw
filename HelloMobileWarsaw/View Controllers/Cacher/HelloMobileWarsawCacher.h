/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import <Foundation/Foundation.h>

extern NSString *const HelloMobileWarsawTextKey;

@interface HelloMobileWarsawCacher : NSObject

- (void)cacheHelloWorldText:(NSString *)text;
- (NSString *)cachedHelloWorldText;

@end
