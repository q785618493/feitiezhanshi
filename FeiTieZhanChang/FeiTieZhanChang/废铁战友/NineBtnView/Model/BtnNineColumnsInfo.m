//
//	BtnNineColumnsInfo.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BtnNineColumnsInfo.h"

@interface BtnNineColumnsInfo ()
@end
@implementation BtnNineColumnsInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"typeid"] isKindOfClass:[NSNull class]]){
		self.typeid = [dictionary[@"typeid"] integerValue];
	}

	if(![dictionary[@"typename"] isKindOfClass:[NSNull class]]){
		self.typename = dictionary[@"typename"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"typeid"] = @(self.typeid);
	if(self.typename != nil){
		dictionary[@"typename"] = self.typename;
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
	[aCoder encodeObject:@(self.typeid) forKey:@"typeid"];	if(self.typename != nil){
		[aCoder encodeObject:self.typename forKey:@"typename"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.typeid = [[aDecoder decodeObjectForKey:@"typeid"] integerValue];
	self.typename = [aDecoder decodeObjectForKey:@"typename"];
	return self;

}
@end