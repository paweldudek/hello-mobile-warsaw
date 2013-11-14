/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import <Foundation/Foundation.h>

@class HelloWorldDownloader;
@class AFHTTPSessionManager;


@protocol HelloWorldDownloaderDelegate <NSObject>

-(void)helloWorldDownloader:(HelloWorldDownloader *)downloader didDownloadHelloWorldText:(NSString *)text;
- (void)helloWorldDownloader:(HelloWorldDownloader *)downloader didFailWithError:(NSError *)error;

@end

@interface HelloWorldDownloader : NSObject
@property(nonatomic, weak) id <HelloWorldDownloaderDelegate> delegate;

@property(nonatomic, readonly) AFHTTPSessionManager *HTTPSessionManager;

- (void)downloadHelloWorldText;

@end
