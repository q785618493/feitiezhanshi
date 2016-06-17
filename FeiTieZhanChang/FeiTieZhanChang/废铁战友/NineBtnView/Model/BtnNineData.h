#import <UIKit/UIKit.h>
#import "BtnNineColumnsInfo.h"
#import "BtnNineList.h"

@interface BtnNineData : NSObject

@property (nonatomic, strong) BtnNineColumnsInfo * columnsInfo;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end