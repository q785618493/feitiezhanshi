//
//	FTShareList.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FTShareList.h"

@interface FTShareList ()
@end
@implementation FTShareList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"addtime"] isKindOfClass:[NSNull class]]){
		self.addtime = [dictionary[@"addtime"] integerValue];
	}

	if(![dictionary[@"addtime_f"] isKindOfClass:[NSNull class]]){
		self.addtimeF = dictionary[@"addtime_f"];
	}	
	if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
		self.content = dictionary[@"content"];
	}	
	if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
		self.contentid = dictionary[@"contentid"];
	}	
	if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
		self.counterList = [[FTShareCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
	}

	if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
		self.coverimg = dictionary[@"coverimg"];
	}	
	if(![dictionary[@"coverimg_wh"] isKindOfClass:[NSNull class]]){
		self.coverimgWh = dictionary[@"coverimg_wh"];
	}	
	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
		self.songid = dictionary[@"songid"];
	}	
	if(![dictionary[@"tag_info"] isKindOfClass:[NSNull class]]){
		self.tagInfo = [[FTShareTagInfo alloc] initWithDictionary:dictionary[@"tag_info"]];
	}

	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[FTShareUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"addtime"] = @(self.addtime);
	if(self.addtimeF != nil){
		dictionary[@"addtime_f"] = self.addtimeF;
	}
	if(self.content != nil){
		dictionary[@"content"] = self.content;
	}
	if(self.contentid != nil){
		dictionary[@"contentid"] = self.contentid;
	}
	if(self.counterList != nil){
		dictionary[@"counterList"] = [self.counterList toDictionary];
	}
	if(self.coverimg != nil){
		dictionary[@"coverimg"] = self.coverimg;
	}
	if(self.coverimgWh != nil){
		dictionary[@"coverimg_wh"] = self.coverimgWh;
	}
	dictionary[@"islike"] = @(self.islike);
	if(self.songid != nil){
		dictionary[@"songid"] = self.songid;
	}
	if(self.tagInfo != nil){
		dictionary[@"tag_info"] = [self.tagInfo toDictionary];
	}
	if(self.userinfo != nil){
		dictionary[@"userinfo"] = [self.userinfo toDictionary];
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.addtime) forKey:@"addtime"];	if(self.addtimeF != nil){
		[aCoder encodeObject:self.addtimeF forKey:@"addtime_f"];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:@"content"];
	}
	if(self.contentid != nil){
		[aCoder encodeObject:self.contentid forKey:@"contentid"];
	}
	if(self.counterList != nil){
		[aCoder encodeObject:self.counterList forKey:@"counterList"];
	}
	if(self.coverimg != nil){
		[aCoder encodeObject:self.coverimg forKey:@"coverimg"];
	}
	if(self.coverimgWh != nil){
		[aCoder encodeObject:self.coverimgWh forKey:@"coverimg_wh"];
	}
	[aCoder encodeObject:@(self.islike) forKey:@"islike"];	if(self.songid != nil){
		[aCoder encodeObject:self.songid forKey:@"songid"];
	}
	if(self.tagInfo != nil){
		[aCoder encodeObject:self.tagInfo forKey:@"tag_info"];
	}
	if(self.userinfo != nil){
		[aCoder encodeObject:self.userinfo forKey:@"userinfo"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addtime = [[aDecoder decodeObjectForKey:@"addtime"] integerValue];
	self.addtimeF = [aDecoder decodeObjectForKey:@"addtime_f"];
	self.content = [aDecoder decodeObjectForKey:@"content"];
	self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
	self.counterList = [aDecoder decodeObjectForKey:@"counterList"];
	self.coverimg = [aDecoder decodeObjectForKey:@"coverimg"];
	self.coverimgWh = [aDecoder decodeObjectForKey:@"coverimg_wh"];
	self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
	self.songid = [aDecoder decodeObjectForKey:@"songid"];
	self.tagInfo = [aDecoder decodeObjectForKey:@"tag_info"];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	return self;

}
@end