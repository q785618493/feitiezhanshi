//
//  FTDataModel.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "FTDataModel.h"

@implementation FTDataModel

- (instancetype)initWithDataModelDic:(NSDictionary *)dic {
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}
+ (instancetype)dataModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithDataModelDic:dic];
}

@end
