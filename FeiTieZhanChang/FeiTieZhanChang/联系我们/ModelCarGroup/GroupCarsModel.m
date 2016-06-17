//
//  GroupCarsModel.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "GroupCarsModel.h"

@implementation GroupCarsModel

- (instancetype)initWithGroupCarsModelDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)carsModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithGroupCarsModelDic:dic];
}

@end
