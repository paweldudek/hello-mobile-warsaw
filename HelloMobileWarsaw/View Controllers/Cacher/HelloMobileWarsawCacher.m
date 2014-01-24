/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "HelloMobileWarsawCacher.h"


NSString *const HelloMobileWarsawTextKey = @"HelloMobileWarsawTextKey";

@implementation HelloMobileWarsawCacher

- (void)cacheHelloWorldText:(NSString *)text {
//    [[NSUserDefaults standardUserDefaults] setValue:text forKey:HelloMobileWarsawTextKey];
}

- (NSString *)cachedHelloWorldText {
//    return [[NSUserDefaults standardUserDefaults] valueForKey:HelloMobileWarsawTextKey];
    return nil;
}

@end
