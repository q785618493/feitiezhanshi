#import <UIKit/UIKit.h>

@interface BtnNineList : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end