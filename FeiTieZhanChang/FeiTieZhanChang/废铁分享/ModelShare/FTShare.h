#import <UIKit/UIKit.h>
#import "FTShareData.h"

@interface FTShare : NSObject

@property (nonatomic, strong) FTShareData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end