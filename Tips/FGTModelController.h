//
//  FGTModelController.h
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import <Foundation/Foundation.h>

//Foward declaration instead of actually importing the entire class
@class FGTTip;

NS_ASSUME_NONNULL_BEGIN

@interface FGTModelController : NSObject

@property (nonatomic, copy, readonly) NSArray<FGTTip *> *tips;

@property (nonatomic, readonly) NSUInteger tipCount;

- (FGTTip *)tipAtIndex:(NSUInteger)index;

-(void)addTip:(FGTTip *)aTip;

@end

NS_ASSUME_NONNULL_END
