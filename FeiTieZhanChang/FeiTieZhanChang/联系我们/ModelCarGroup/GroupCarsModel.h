//
//  GroupCarsModel.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupCarsModel : NSObject

@property (strong, nonatomic) NSArray *cars;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;

- (instancetype)initWithGroupCarsModelDic:(NSDictionary *)dic;
+ (instancetype)carsModelDic:(NSDictionary *)dic;

@end
