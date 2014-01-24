#define MOCKITO_SHORTHAND
#import "OCMockito.h"

#import "HelloMobileWarsawViewController.h"
#import "CDRSpec.h"

#define EXP_SHORTHAND
#import "Expecta.h"
#import "HelloMobileWarsawCacher.h"

SPEC_BEGIN(HelloMobileWarsawViewControllerSpec)

describe(@"HelloMobileWarsawViewController", ^{
    __block HelloMobileWarsawViewController *mobileWarsawViewController;

    beforeEach(^{
        mobileWarsawViewController = [[HelloMobileWarsawViewController alloc] init];
    });

    it(@"should have a cacher", ^{
        expect(mobileWarsawViewController.cacher).to.beKindOf([HelloMobileWarsawCacher class]);
    });

    describe(@"downloader", ^{

        __block HelloWorldDownloader *downloader;

        action(^{
            downloader = [mobileWarsawViewController helloWorldDownloader];
        });

        it(@"should have a downloader", ^{
            expect(downloader).to.beKindOf([HelloWorldDownloader class]);
        });

        it(@"should have a delegate", ^{
            expect(downloader.delegate).to.equal(mobileWarsawViewController);
        });
    });

    describe(@"view will appear", ^{

        __block id mockDownloader;

        beforeEach(^{
            mockDownloader = mock([HelloWorldDownloader class]);
            [mobileWarsawViewController setValue:mockDownloader forKey:@"helloWorldDownloader"];
        });

        action(^{
            [mobileWarsawViewController viewWillAppear:YES];
        });

        it(@"should start downloading hello text", ^{
            [verify(mockDownloader) downloadHelloWorldText];
        });
    });

    describe(@"label", ^{

        __block UILabel *label;

        beforeEach(^{
            [mobileWarsawViewController view];
        });

        action(^{
            label = [mobileWarsawViewController textLabel];
        });

        it(@"should have a label", ^{
            expect(label).to.beKindOf([UILabel class]);
        });

        it(@"should have initial text", ^{
            expect(label.text).to.equal(@"Fetching text...");
        });
   });

    describe(@"hello world downloader delegate", ^{

        beforeEach(^{
            [mobileWarsawViewController view];
        });

        describe(@"did download text", ^{

            __block id mockCacher;

            beforeEach(^{
                mockCacher = mock([HelloMobileWarsawCacher class]);
                [mobileWarsawViewController setValue:mockCacher forKey:@"cacher"];
            });

            action(^{
                [mobileWarsawViewController helloWorldDownloader:nil didDownloadHelloWorldText:@"Fixture Text"];
            });

            it(@"should update the text on text field to downloaded text", ^{
                expect(mobileWarsawViewController.textLabel.text).to.equal(@"Fixture Text");
            });

            it(@"should tell the cacher to cache the text", ^{
                [verify(mockCacher) cacheHelloWorldText:@"Fixture Text"];
            });
        });

        describe(@"did fail with error", ^{

            __block NSError *error;

            beforeEach(^{
                error = [NSError errorWithDomain:@"Fixture Domain" code:42 userInfo:nil];
            });

            action(^{
                [mobileWarsawViewController helloWorldDownloader:nil didFailWithError:error];
            });

            it(@"should show an alert view with recovery sugesstion", PENDING);
        });
    });
});

SPEC_END
