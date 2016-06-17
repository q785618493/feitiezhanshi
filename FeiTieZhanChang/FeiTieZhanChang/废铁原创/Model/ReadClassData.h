#import <UIKit/UIKit.h>
#import "ReadClassList.h"

@interface ReadClassData : NSObject

@property (nonatomic, strong) NSArray * list;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end