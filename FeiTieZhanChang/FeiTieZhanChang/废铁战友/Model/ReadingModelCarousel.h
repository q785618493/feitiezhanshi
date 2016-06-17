#import <UIKit/UIKit.h>

@interface ReadingModelCarousel : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end