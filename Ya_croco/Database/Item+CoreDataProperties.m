//
//  Item+CoreDataProperties.m
//  
//
//  Created by Tatiana Mudryak on 04/12/2017.
//
//

#import "Item+CoreDataProperties.h"

@implementation Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Item"];
}

@dynamic itemDescription;
@dynamic price;
@dynamic discount;
@dynamic imageURL;
@dynamic retailer;

@end
