#import <UIKit/UIKit.h>

/**请求成功后的第一层数据**/
@interface IchibanData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

/**成功后返回的数据**/
@interface Ichiban : NSObject

@property (nonatomic, strong) IchibanData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

/**描述信息**/
@interface IchibanList : NSObject

@property (nonatomic, strong) NSString * buyurl;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end