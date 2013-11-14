/*
 * Copyright 2013 Taptera Inc. All rights reserved.
 */


#import "HelloMobileWarsawViewController.h"


@implementation HelloMobileWarsawViewController

- (id)init {
    self = [super init];
    if (self) {
        _helloWorldDownloader = [[HelloWorldDownloader alloc] init];
        self.helloWorldDownloader.delegate = self;
    }

    return self;
}

#pragma mark - UIViewController Specific

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [[self helloWorldDownloader] downloadHelloWorldText];
}

#pragma mark - HelloWorldDownloader Delegate

- (void)helloWorldDownloader:(HelloWorldDownloader *)downloader didDownloadHelloWorldText:(NSString *)text {
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
