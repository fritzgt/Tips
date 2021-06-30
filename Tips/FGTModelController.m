//
//  FGTModelController.m
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import "FGTModelController.h"
#import "FGTTip.h"

//This is like a private interface
@interface FGTModelController (){
    NSMutableArray *_internalTips;
}

@end



@implementation FGTModelController

-(instancetype) init
{
    if (self = [super init]){
        _internalTips = [[NSMutableArray alloc] init];
        
        //add test data
        [self addTestData];
    }
    
    return  self;
}


- (void) addTestData
{
    //1.Init an instace of the tip
    FGTTip *aTip = [[FGTTip alloc] initWithName:@"Shushi"
                                           total:200
                                      splitCount:4
                                   tipPercentage:20.];
    //2. add it to the array of tips
    [_internalTips addObject: aTip];
}


//Method 1
- (NSArray<FGTTip *> *)tips
{
    return _internalTips.copy;
}

//Method 2
- (NSUInteger)tipCount
{
    return _internalTips.count;
}

//Method 3
- (FGTTip *)tipAtIndex:(NSUInteger)index
{
    return [_internalTips objectAtIndex:index];
}

//Method 4
- (void)addTip:(FGTTip *)aTip
{
    [_internalTips addObject:aTip];
}

@end
