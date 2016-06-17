//
//  NSArray+CellShareHeight.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "NSArray+CellShareHeight.h"
#import "NSString+Helper.h"
#import "ShareHeader.h"

@implementation NSArray (CellShareHeight)

+ (NSArray *)returnHeightArray:(NSArray *)array {
    
    NSMutableArray *heightArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < array.count; i ++) {
        
        FTShareList *list = array[i];
        CGFloat imageH = 0;
        CGFloat textH = 0;
        
        if (![list.coverimg isEmptyString]) {
            NSString *imageSize = list.coverimgWh;
            NSArray *arraySize = [imageSize componentsSeparatedByString:@"*"];
            imageH = [arraySize[1] floatValue] * ((VIEW_WIDTH - 40.0) / [arraySize[0] floatValue]);
        }
        NSNumber *imageHeight = [NSNumber numberWithFloat:imageH];
        
        if (!(list.content.length == 0)) {
            textH = [NSString autoHeightWithString:list.content Width:VIEW_WIDTH - 40 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:14.0f]];
        }
        
        NSNumber *textHeight = [NSNumber numberWithFloat:textH + 20];
        NSNumber *cellHeighe = [NSNumber numberWithFloat:imageH + textH + 116];
        NSDictionary *dicHeight = @{@"cellHeight":cellHeighe,@"imageHeight":imageHeight,@"textHeight":textHeight};
        [heightArray addObject:dicHeight];
        
    }
    return heightArray;
}

@end
