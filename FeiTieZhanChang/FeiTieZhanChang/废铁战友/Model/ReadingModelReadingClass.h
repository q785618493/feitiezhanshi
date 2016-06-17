#import <UIKit/UIKit.h>
#import "ReadingModelData.h"

@interface ReadingModelReadingClass : NSObject

@property (nonatomic, strong) ReadingModelData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end