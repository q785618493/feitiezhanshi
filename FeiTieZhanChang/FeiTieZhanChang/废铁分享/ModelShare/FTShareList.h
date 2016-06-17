#import <UIKit/UIKit.h>
#import "FTShareCounterList.h"
#import "FTShareTagInfo.h"
#import "FTShareUserinfo.h"

@interface FTShareList : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) FTShareCounterList * counterList;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) FTShareTagInfo * tagInfo;
@property (nonatomic, strong) FTShareUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end