//
//  FGTModelController.m
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import "FGTModelController.h"

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
    }
    
    return  self;
}

- (NSArray<FGTTip *> *)tips
{
    return _internalTips.copy;
}


@end
