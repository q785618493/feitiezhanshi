//
//	ReadClassCounterList.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ReadClassCounterList.h"

@interface ReadClassCounterList ()
@end
@implementation ReadClassCounterList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"comment"] isKindOfClass:[NSNull class]]){
		self.comment = [dictionary[@"comment"] integerValue];
	}

	if(![dictionary[@"fav"] isKindOfClass:[NSNull class]]){
		self.fav = [dictionary[@"fav"] integerValue];
	}

	if(![dictionary[@"like"] isKindOfClass:[NSNull class]]){
		self.like = [dictionary[@"like"] integerValue];
	}

	if(![dictionary[@"view"] isKindOfClass:[NSNull class]]){
		self.view = [dictionary[@"view"] integerValue];
	}

	if(![dictionary[@"vote"] isKindOfClass:[NSNull class]]){
		self.vote = [dictionary[@"vote"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"comment"] = @(self.comment);
	dictionary[@"fav"] = @(self.fav);
	dictionary[@"like"] = @(self.like);
	dictionary[@"view"] = @(self.view);
	dictionary[@"vote"] = @(self.vote);
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
	[aCoder encodeObject:@(self.comment) forKey:@"comment"];	[aCoder encodeObject:@(self.fav) forKey:@"fav"];	[aCoder encodeObject:@(self.like) forKey:@"like"];	[aCoder encodeObject:@(self.view) forKey:@"view"];	[aCoder encodeObject:@(self.vote) forKey:@"vote"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.comment = [[aDecoder decodeObjectForKey:@"comment"] integerValue];
	self.fav = [[aDecoder decodeObjectForKey:@"fav"] integerValue];
	self.like = [[aDecoder decodeObjectForKey:@"like"] integerValue];
	self.view = [[aDecoder decodeObjectForKey:@"view"] integerValue];
	self.vote = [[aDecoder decodeObjectForKey:@"vote"] integerValue];
	return self;

}
@end