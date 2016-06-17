//
//	ReadClassList.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ReadClassList.h"

@interface ReadClassList ()
@end
@implementation ReadClassList




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
	if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
		self.contentid = dictionary[@"contentid"];
	}	
	if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
		self.counterList = [[ReadClassCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
	}

	if(![dictionary[@"firstimage"] isKindOfClass:[NSNull class]]){
		self.firstimage = dictionary[@"firstimage"];
	}	
	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"shortcontent"] isKindOfClass:[NSNull class]]){
		self.shortcontent = dictionary[@"shortcontent"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[ReadClassUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
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
	if(self.contentid != nil){
		dictionary[@"contentid"] = self.contentid;
	}
	if(self.counterList != nil){
		dictionary[@"counterList"] = [self.counterList toDictionary];
	}
	if(self.firstimage != nil){
		dictionary[@"firstimage"] = self.firstimage;
	}
	dictionary[@"islike"] = @(self.islike);
	if(self.shortcontent != nil){
		dictionary[@"shortcontent"] = self.shortcontent;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
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
	if(self.contentid != nil){
		[aCoder encodeObject:self.contentid forKey:@"contentid"];
	}
	if(self.counterList != nil){
		[aCoder encodeObject:self.counterList forKey:@"counterList"];
	}
	if(self.firstimage != nil){
		[aCoder encodeObject:self.firstimage forKey:@"firstimage"];
	}
	[aCoder encodeObject:@(self.islike) forKey:@"islike"];	if(self.shortcontent != nil){
		[aCoder encodeObject:self.shortcontent forKey:@"shortcontent"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
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
	self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
	self.counterList = [aDecoder decodeObjectForKey:@"counterList"];
	self.firstimage = [aDecoder decodeObjectForKey:@"firstimage"];
	self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
	self.shortcontent = [aDecoder decodeObjectForKey:@"shortcontent"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	return self;

}
@end