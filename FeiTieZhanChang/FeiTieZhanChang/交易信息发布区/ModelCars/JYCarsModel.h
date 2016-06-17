//
//  JYCarsModel.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYCarsModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *cars;

- (instancetype)initWithCarsModelDic:(NSDictionary *)dic;
+ (instancetype)carsModelDic:(NSDictionary *)dic;

@end
