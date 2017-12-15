//
//  ItemStoreManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemStoreManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Item.h"

@implementation ItemStoreManager

+ (instancetype)sharedManager
{
	static ItemStoreManager *sharedItemStoreManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedItemStoreManager = [ItemStoreManager new];
	});
	return sharedItemStoreManager;
}

- (NSArray *)createItemsWithData:(NSArray *)items
{
	NSMutableArray *parsedItems = [NSMutableArray new];
	for (NSDictionary *info in items)
	{
		Item *item = [Item MR_createEntityInContext:ManagedObjectContext];

		NSString *keyValue = nil;
		for (NSString *key in info) {
			keyValue = key;
			if ([keyValue isEqualToString:@"description"]) {
				keyValue = @"itemDescription";
			}

			if ([item respondsToSelector:NSSelectorFromString(keyValue)]) {
				[item setValue:info[key] forKey:keyValue];
			}

			item.inCart = @NO;
		}
			NSLog(@"%@", info);
		[parsedItems addObject:item];
	}
	[ManagedObjectContext MR_saveToPersistentStoreAndWait];
	return [parsedItems copy];
}

- (void)foundItemWithText:(NSString *)text andCompletionHandler:(ItemSearchCompletionHandler)completionHandler
{
	[ManagedObjectContext performBlock:^{
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word CONTAINS[cd] %@", text];
		NSArray *privateObjects = [self entitiesInContext:ManagedObjectContext withPredicate:predicate];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjects];
			NSArray *finalResults = [Item MR_findAllWithPredicate:mainPredicate];
			completionHandler(finalResults);
		});
	}];
}

-(NSArray *)entitiesInContext:(NSManagedObjectContext *)context withPredicate:(NSPredicate *)predicate
{
	NSArray *privateObjects = nil;
	if (!predicate) {
		privateObjects = [Item MR_findAllInContext:ManagedObjectContext];
	} else {
		privateObjects = [Item MR_findAllWithPredicate:predicate inContext:ManagedObjectContext];
	}
	NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
	return privateObjectIDs;
}

@end
