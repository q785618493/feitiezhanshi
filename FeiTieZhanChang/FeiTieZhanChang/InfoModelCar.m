//
//  InfoModelCar.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "InfoModelCar.h"

@implementation InfoModelCar

- (instancetype)initWithModelCarDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)modelCarDic:(NSDictionary *)dic {
    return [[self alloc] initWithModelCarDic:dic];
}

@end
