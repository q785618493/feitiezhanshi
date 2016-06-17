#import <UIKit/UIKit.h>

@interface FTShareTagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL offical;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end