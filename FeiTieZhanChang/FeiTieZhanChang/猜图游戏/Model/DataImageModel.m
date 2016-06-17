//
//  DataImageModel.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "DataImageModel.h"

@implementation DataImageModel

- (instancetype)initWithDataImageModelDic:(NSDictionary *)dic {
    if (self = [super init]) {
        self.answer = dic[@"answer"];
        self.icon = dic[@"icon"];
        self.title = dic[@"title"];
        self.options = dic[@"options"];
    }
    return self;
}

+ (instancetype)dataImageModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithDataImageModelDic:dic];
}

@end
