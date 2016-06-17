//
//  JYCarsModel.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "JYCarsModel.h"
#import "InfoModelCar.h"

@implementation JYCarsModel

- (instancetype)initWithCarsModelDic:(NSDictionary *)dic {
    if (self = [super init]) {
       
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *twoMuArray = [NSMutableArray array];
        for (NSDictionary *dic in _cars) {
            InfoModelCar *model = [InfoModelCar modelCarDic:dic];
            [twoMuArray addObject:model];
        }
        self.cars = twoMuArray;
    }
    return self;
}

+ (instancetype)carsModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithCarsModelDic:dic];
}

@end
