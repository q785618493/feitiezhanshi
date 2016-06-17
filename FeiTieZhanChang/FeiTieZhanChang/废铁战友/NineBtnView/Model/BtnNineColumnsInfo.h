#import <UIKit/UIKit.h>

@interface BtnNineColumnsInfo : NSObject

@property (nonatomic, assign) NSInteger typeid;
@property (nonatomic, strong) NSString * typename;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end