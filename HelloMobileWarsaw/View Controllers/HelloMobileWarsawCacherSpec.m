#define MOCKITO_SHORTHAND
#import "OCMockito.h"

#import "HelloMobileWarsawCacher.h"
#import "CDRSpec.h"

#define EXP_SHORTHAND
#import "Expecta.h"

SPEC_BEGIN(HelloMobileWarsawViewControllerSpec)

describe(@"HelloMobileWarsawViewController", ^{
    __block HelloMobileWarsawCacher *mobileWarsawCacher;

    beforeEach(^{
        mobileWarsawCacher = [[HelloMobileWarsawCacher alloc] init];
    });

    describe(@"cache hello world text", ^{

    });
});

SPEC_END
