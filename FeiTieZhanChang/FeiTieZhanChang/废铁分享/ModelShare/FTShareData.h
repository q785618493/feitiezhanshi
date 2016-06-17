#import <UIKit/UIKit.h>
#import "FTShareList.h"

@interface FTShareData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSObject * tagOffical;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end