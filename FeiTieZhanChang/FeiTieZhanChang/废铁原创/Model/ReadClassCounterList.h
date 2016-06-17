#import <UIKit/UIKit.h>

@interface ReadClassCounterList : NSObject

@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger fav;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, assign) NSInteger view;
@property (nonatomic, assign) NSInteger vote;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;
@end