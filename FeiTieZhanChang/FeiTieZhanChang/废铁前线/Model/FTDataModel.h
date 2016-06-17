//
//  FTDataModel.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTDataModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;

- (instancetype)initWithDataModelDic:(NSDictionary *)dic;
+ (instancetype)dataModelDic:(NSDictionary *)dic;

@end
