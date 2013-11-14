/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import "FakeHTTPSessionManager.h"


@implementation FakeHTTPSessionManager

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    self.lastSuccess = [success copy];
    self.lastFailure = [failure copy];

    self.lastGETURLString = URLString;
    
    return nil;
}

- (void)simulateSuccessWithResponse:(id)response {
    if (self.lastSuccess) {
        self.lastSuccess(nil, response);
    }
}

- (void)simulateFailureWithError:(NSError *)error {
    if (self.lastFailure) {
        self.lastFailure(nil, error);
    }
}

@end
