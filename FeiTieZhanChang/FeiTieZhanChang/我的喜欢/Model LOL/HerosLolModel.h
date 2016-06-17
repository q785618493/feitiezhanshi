//
//  HerosLolModel.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HerosLolModel : NSObject

@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *intro;

- (instancetype)initWithLolModelDic:(NSDictionary *)dic;
+ (instancetype)lolModelDic:(NSDictionary *)dic;

@end
