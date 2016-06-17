#import <UIKit/UIKit.h>

@interface ReadingModelList : NSObject

@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * enname;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end