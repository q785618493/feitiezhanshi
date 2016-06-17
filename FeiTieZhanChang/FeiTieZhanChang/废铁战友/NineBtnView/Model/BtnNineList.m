//
//	BtnNineList.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BtnNineList.h"

@interface BtnNineList ()
@end
@implementation BtnNineList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
		self.content = dictionary[@"content"];
	}	
	if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
		self.coverimg = dictionary[@"coverimg"];
	}	
	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[@"id"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.content != nil){
		dictionary[@"content"] = self.content;
	}
	if(self.coverimg != nil){
		dictionary[@"coverimg"] = self.coverimg;
	}
	if(self.idField != nil){
		dictionary[@"id"] = self.idField;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
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
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:@"content"];
	}
	if(self.coverimg != nil){
		[aCoder encodeObject:self.coverimg forKey:@"coverimg"];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:@"id"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.content = [aDecoder decodeObjectForKey:@"content"];
	self.coverimg = [aDecoder decodeObjectForKey:@"coverimg"];
	self.idField = [aDecoder decodeObjectForKey:@"id"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end