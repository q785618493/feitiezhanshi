//
//	FTShareData.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FTShareData.h"

@interface FTShareData ()
@end
@implementation FTShareData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			FTShareList * listItem = [[FTShareList alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	if(![dictionary[@"tag_offical"] isKindOfClass:[NSNull class]]){
		self.tagOffical = dictionary[@"tag_offical"];
	}	
	if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
		self.total = [dictionary[@"total"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(FTShareList * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
	}
	if(self.tagOffical != nil){
		dictionary[@"tag_offical"] = self.tagOffical;
	}
	dictionary[@"total"] = @(self.total);
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
	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:@"list"];
	}
	if(self.tagOffical != nil){
		[aCoder encodeObject:self.tagOffical forKey:@"tag_offical"];
	}
	[aCoder encodeObject:@(self.total) forKey:@"total"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	self.tagOffical = [aDecoder decodeObjectForKey:@"tag_offical"];
	self.total = [[aDecoder decodeObjectForKey:@"total"] integerValue];
	return self;

}
@end