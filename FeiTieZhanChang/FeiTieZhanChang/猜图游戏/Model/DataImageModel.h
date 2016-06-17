//
//  DataImageModel.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataImageModel : NSObject

@property (copy, nonatomic) NSString *answer;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *options;

- (instancetype)initWithDataImageModelDic:(NSDictionary *)dic;
+ (instancetype)dataImageModelDic:(NSDictionary *)dic;

@end
