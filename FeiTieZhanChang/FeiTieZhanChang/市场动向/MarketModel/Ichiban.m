//
//	Ichiban.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Ichiban.h"

@interface IchibanData ()
@end
@implementation IchibanData
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
            IchibanList * listItem = [[IchibanList alloc] initWithDictionary:listDictionary];
            [listItems addObject:listItem];
        }
        self.list = listItems;
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
        for(IchibanList * listElement in self.list){
            [dictionaryElements addObject:[listElement toDictionary]];
        }
        dictionary[@"list"] = dictionaryElements;
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
    [aCoder encodeObject:@(self.total) forKey:@"total"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.list = [aDecoder decodeObjectForKey:@"list"];
    self.total = [[aDecoder decodeObjectForKey:@"total"] integerValue];
    return self;
    
}
@end

/** **/
@interface Ichiban ()
@end
@implementation Ichiban
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[IchibanData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.data != nil){
		dictionary[@"data"] = [self.data toDictionary];
	}
	dictionary[@"result"] = @(self.result);
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
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:@"data"];
	}
	[aCoder encodeObject:@(self.result) forKey:@"result"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.data = [aDecoder decodeObjectForKey:@"data"];
	self.result = [[aDecoder decodeObjectForKey:@"result"] integerValue];
	return self;

}
@end

/** **/
@interface IchibanList ()
@end
@implementation IchibanList

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"buyurl"] isKindOfClass:[NSNull class]]){
        self.buyurl = dictionary[@"buyurl"];
    }
    if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
        self.contentid = dictionary[@"contentid"];
    }
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
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
    if(self.buyurl != nil){
        dictionary[@"buyurl"] = self.buyurl;
    }
    if(self.contentid != nil){
        dictionary[@"contentid"] = self.contentid;
    }
    if(self.coverimg != nil){
        dictionary[@"coverimg"] = self.coverimg;
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
    if(self.buyurl != nil){
        [aCoder encodeObject:self.buyurl forKey:@"buyurl"];
    }
    if(self.contentid != nil){
        [aCoder encodeObject:self.contentid forKey:@"contentid"];
    }
    if(self.coverimg != nil){
        [aCoder encodeObject:self.coverimg forKey:@"coverimg"];
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
    self.buyurl = [aDecoder decodeObjectForKey:@"buyurl"];
    self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
    self.coverimg = [aDecoder decodeObjectForKey:@"coverimg"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    return self;
    
}
@end