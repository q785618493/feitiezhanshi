#import <UIKit/UIKit.h>
#import "ReadClassCounterList.h"
#import "ReadClassUserinfo.h"

@interface ReadClassList : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) ReadClassCounterList * counterList;
@property (nonatomic, strong) NSString * firstimage;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString * shortcontent;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) ReadClassUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end