/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import "HelloMobileWarsawViewController.h"
#import "HelloMobileWarsawCacher.h"


@implementation HelloMobileWarsawViewController

- (id)init {
    self = [super init];
    if (self) {
        _helloWorldDownloader = [[HelloWorldDownloader alloc] init];
        self.helloWorldDownloader.delegate = self;

        _cacher = [[HelloMobileWarsawCacher alloc] init];
    }

    return self;
}

#pragma mark - UIViewController Specific

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.textLabel.text = [[self cacher] cachedHelloWorldText];

    [[self helloWorldDownloader] downloadHelloWorldText];
}

#pragma mark - HelloWorldDownloader Delegate

- (void)helloWorldDownloader:(HelloWorldDownloader *)downloader didDownloadHelloWorldText:(NSString *)text {
    [[self cacher] cacheHelloWorldText:text];
    self.textLabel.text = text;
}

- (void)helloWorldDownloader:(HelloWorldDownloader *)downloader didFailWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whoops something went wrong!"
                                                        message:[error localizedRecoverySuggestion]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
