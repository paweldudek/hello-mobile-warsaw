#define EXP_SHORTHAND
#import "Expecta.h"

#define MOCKITO_SHORTHAND
#import "OCMockito.h"

#import "HelloWorldDownloader.h"
#import "CDRSpec.h"
#import "FakeHTTPSessionManager.h"

SPEC_BEGIN(HelloWorldDownloaderSpec)

describe(@"HelloWorldDownloader", ^{
    __block HelloWorldDownloader *worldDownloader;

    beforeEach(^{
        worldDownloader = [[HelloWorldDownloader alloc] init];
    });

    describe(@"download hello world text", ^{

        __block FakeHTTPSessionManager *fakeHTTPSessionManager;
        __block id mockDelegate = nil;
        __block NSDictionary *response;

        beforeEach(^{
            mockDelegate = mockProtocol(@protocol(HelloWorldDownloaderDelegate));
            worldDownloader.delegate = mockDelegate;

            fakeHTTPSessionManager = [FakeHTTPSessionManager new];
            [worldDownloader setValue:fakeHTTPSessionManager forKey:@"HTTPSessionManager"];

            response = @{@"hello" : @"Fixture Text"};
        });

        action(^{
            [worldDownloader downloadHelloWorldText];
        });

        it(@"should make a GET request for welcoming text", ^{
            expect(fakeHTTPSessionManager.lastGETURLString).to.equal(@"welcoming/show");
        });

        describe(@"when the request is sucessful", ^{
            action(^{
                [fakeHTTPSessionManager simulateSuccessWithResponse:response];
            });

            it(@"should inform its delegate", ^{
                [verify(mockDelegate) helloWorldDownloader:worldDownloader didDownloadHelloWorldText:@"Fixture Text"];
            });
        });

        describe(@"when the request fails", ^{

            __block NSError *error;

            action(^{
                error = [NSError errorWithDomain:@"Fixture Domain" code:42 userInfo:nil];
                [fakeHTTPSessionManager simulateFailureWithError:error];
            });

            it(@"should inform the delegate that it failed", ^{
                [verify(mockDelegate) helloWorldDownloader:worldDownloader didFailWithError:error];
            });
        });
    });
});

SPEC_END
