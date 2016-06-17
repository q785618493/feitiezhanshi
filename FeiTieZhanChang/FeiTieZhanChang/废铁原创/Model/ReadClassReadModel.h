#import <UIKit/UIKit.h>
#import "ReadClassData.h"

@interface ReadClassReadModel : NSObject

@property (nonatomic, strong) ReadClassData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end