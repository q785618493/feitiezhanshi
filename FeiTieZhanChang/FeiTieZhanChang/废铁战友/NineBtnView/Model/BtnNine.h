#import <UIKit/UIKit.h>
#import "BtnNineData.h"

@interface BtnNine : NSObject

@property (nonatomic, strong) BtnNineData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end