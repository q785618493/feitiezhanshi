#import <UIKit/UIKit.h>
#import "ReadingModelCarousel.h"
#import "ReadingModelList.h"

@interface ReadingModelData : NSObject

@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSArray * list;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end