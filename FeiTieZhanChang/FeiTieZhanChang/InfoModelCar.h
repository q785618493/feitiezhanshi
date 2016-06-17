//
//  InfoModelCar.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoModelCar : NSObject

@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *name;

- (instancetype)initWithModelCarDic:(NSDictionary *)dic;
+ (instancetype)modelCarDic:(NSDictionary *)dic;

@end
