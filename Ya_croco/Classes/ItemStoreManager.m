//
//  ItemStoreManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemStoreManager.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation ItemStoreManager

+(NSArray *)createItemsWithData:(NSArray *)items
{
	NSMutableArray *parsedItems = [NSMutableArray new];
	for (NSDictionary *info in items)
	{
		NSEntityDescription *entity = [NSEntityDescription entityForName:@"Item" inManagedObjectContext:ManagedObjectContext];
		NSManagedObject *item = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:ManagedObjectContext];

		NSString *keyValue = nil;
		for (NSString *key in info) {
			keyValue = key;
			if ([keyValue isEqualToString:@"description"]) {
				keyValue = @"itemDescription";
			}

			if ([item respondsToSelector:NSSelectorFromString(keyValue)]) {
				[item setValue:info[key] forKey:keyValue];
			}
		}
		[parsedItems addObject:item];
	}
	[ManagedObjectContext MR_saveToPersistentStoreAndWait];
	return [parsedItems copy];
}

@end
