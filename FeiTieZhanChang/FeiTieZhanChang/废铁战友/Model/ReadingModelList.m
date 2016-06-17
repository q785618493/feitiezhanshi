//
//	ReadingModelList.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ReadingModelList.h"

@interface ReadingModelList ()
@end
@implementation ReadingModelList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
		self.coverimg = dictionary[@"coverimg"];
	}	
	if(![dictionary[@"enname"] isKindOfClass:[NSNull class]]){
		self.enname = dictionary[@"enname"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[@"type"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.coverimg != nil){
		dictionary[@"coverimg"] = self.coverimg;
	}
	if(self.enname != nil){
		dictionary[@"enname"] = self.enname;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	dictionary[@"type"] = @(self.type);
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
	if(self.coverimg != nil){
		[aCoder encodeObject:self.coverimg forKey:@"coverimg"];
	}
	if(self.enname != nil){
		[aCoder encodeObject:self.enname forKey:@"enname"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	[aCoder encodeObject:@(self.type) forKey:@"type"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.coverimg = [aDecoder decodeObjectForKey:@"coverimg"];
	self.enname = [aDecoder decodeObjectForKey:@"enname"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.type = [[aDecoder decodeObjectForKey:@"type"] integerValue];
	return self;

}
@end