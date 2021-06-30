//
//  FGTTip.h
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGTTip : NSObject


@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) double total;
@property (nonatomic, readonly) NSInteger splitCount;
@property (nonatomic, readonly) double tipPercentage;


@end

NS_ASSUME_NONNULL_END
