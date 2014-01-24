#define MOCKITO_SHORTHAND
#import "OCMockito.h"

#import "HelloMobileWarsawCacher.h"
#import "CDRSpec.h"

#define EXP_SHORTHAND
#import "Expecta.h"

SPEC_BEGIN(HelloMobileWarsawCacherSpec)

describe(@"HelloMobileWarsawCacher", ^{
    __block HelloMobileWarsawCacher *mobileWarsawCacher;

    beforeEach(^{
        mobileWarsawCacher = [[HelloMobileWarsawCacher alloc] init];
    });

    describe(@"cache hello world text", ^{

        beforeEach(^{
            [mobileWarsawCacher cacheHelloWorldText:@"Fixture Text"];
        });

    });

    describe(@"cached hello world text", ^{

        __block NSString *helloWorldText;

        beforeEach(^{
            helloWorldText = [mobileWarsawCacher cachedHelloWorldText];
        });
    });
});

SPEC_END
