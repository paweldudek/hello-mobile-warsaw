/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"


@interface FakeHTTPSessionManager : AFHTTPSessionManager
@property(nonatomic, copy) void (^lastSuccess)(NSURLSessionDataTask *, id);
@property(nonatomic, copy) void (^lastFailure)(NSURLSessionDataTask *, NSError *);

@property(nonatomic, copy) NSString *lastGETURLString;

- (void)simulateSuccessWithResponse:(id)response;

- (void)simulateFailureWithError:(NSError *)error;

@end
