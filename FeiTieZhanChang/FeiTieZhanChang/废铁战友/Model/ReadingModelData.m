//
//	ReadingModelData.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ReadingModelData.h"

@interface ReadingModelData ()
@end
@implementation ReadingModelData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"carousel"] != nil && [dictionary[@"carousel"] isKindOfClass:[NSArray class]]){
		NSArray * carouselDictionaries = dictionary[@"carousel"];
		NSMutableArray * carouselItems = [NSMutableArray array];
		for(NSDictionary * carouselDictionary in carouselDictionaries){
			ReadingModelCarousel * carouselItem = [[ReadingModelCarousel alloc] initWithDictionary:carouselDictionary];
			[carouselItems addObject:carouselItem];
		}
		self.carousel = carouselItems;
	}
	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			ReadingModelList * listItem = [[ReadingModelList alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.carousel != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(ReadingModelCarousel * carouselElement in self.carousel){
			[dictionaryElements addObject:[carouselElement toDictionary]];
		}
		dictionary[@"carousel"] = dictionaryElements;
	}
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(ReadingModelList * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
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
	if(self.carousel != nil){
		[aCoder encodeObject:self.carousel forKey:@"carousel"];
	}
	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:@"list"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.carousel = [aDecoder decodeObjectForKey:@"carousel"];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	return self;

}
@end