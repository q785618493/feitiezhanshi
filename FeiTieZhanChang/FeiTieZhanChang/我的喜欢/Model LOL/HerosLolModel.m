//
//  HerosLolModel.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "HerosLolModel.h"

@implementation HerosLolModel

- (instancetype)initWithLolModelDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)lolModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithLolModelDic:dic];
}

@end
