/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import <Foundation/Foundation.h>
#import "HelloWorldDownloader.h"

@class HelloWorldDownloader;


@interface HelloMobileWarsawViewController : UIViewController <HelloWorldDownloaderDelegate>
@property(nonatomic, readonly) HelloWorldDownloader *helloWorldDownloader;
@property(nonatomic, strong) IBOutlet UILabel *textLabel;
@end
