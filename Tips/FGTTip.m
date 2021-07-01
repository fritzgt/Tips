//
//  FGTTip.m
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import "FGTTip.h"

@implementation FGTTip

- (instancetype)initWithName:(NSString *)aName
                       total:(double)aTotal
                  splitCount:(NSInteger)aSplitCount tipPercentage:(double)aTipPercentage{
    if (self = [super init]){
        _name = aName.copy;//When marking a prop as copy you must grab the copy
        _total = aTotal;
        _splitCount = aSplitCount;
        _tipPercentage = aTipPercentage;
    }
    
    return  self;
}




@end
