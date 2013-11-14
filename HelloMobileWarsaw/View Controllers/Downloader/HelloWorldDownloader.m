/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import "HelloWorldDownloader.h"
#import "AFHTTPSessionManager.h"


@implementation HelloWorldDownloader

- (id)init {
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"http://mobile-warsaw-example.herokuapp.com/"];
        _HTTPSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }

    return self;
}

- (void)downloadHelloWorldText {
    void (^success)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
        NSString *text = responseObject[@"hello"];

        //Make sure the test fails first
        [[self delegate] helloWorldDownloader:self didDownloadHelloWorldText:text];
    };
    void (^failure)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        [[self delegate] helloWorldDownloader:self didFailWithError:error];
    };
    [self.HTTPSessionManager GET:@"welcoming/show" parameters:nil success:success failure:failure];
}

@end
