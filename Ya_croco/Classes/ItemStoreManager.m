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
		if (info[@"description"]) {
			NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemDescription == %@", info[@"description"]];
			Item *item = [Item MR_findFirstWithPredicate:predicate inContext:ManagedObjectContext];
            if (!item) {
				item = [Item MR_createEntityInContext:ManagedObjectContext];
                item.itemDescription = info[@"description"];
                item.imageURL = info[@"image"] ? info[@"image"] : nil;
                item.price = info[@"price"] ? [info[@"price"] doubleValue] : 0;
				item.discount = info[@"discount"] ? [info[@"discount"] doubleValue] : 0;
				item.retailer = info[@"retailer"] ? info[@"retailer"] : nil;
                item.inCart = NO;
            }
            [parsedItems addObject:item];
		}
	}
	[ManagedObjectContext MR_saveToPersistentStoreAndWait];
	return [parsedItems copy];
}

- (void)foundItemWithText:(NSString *)text andCompletionHandler:(ItemSearchCompletionHandler)completionHandler
{
	[ManagedObjectContext performBlock:^{
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemDescription CONTAINS[cd] %@", text];
		NSArray *privateObjects = [self entitiesInContext:ManagedObjectContext withPredicate:predicate];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjects];
			NSArray *finalResults = [Item MR_findAllWithPredicate:mainPredicate];
            
            NSArray *sortedArray = [finalResults sortedArrayUsingComparator:^NSComparisonResult(id a, id b)
            {
                Item *aItem = (Item*)a;
                Item *bItem = (Item*)b;
                NSString *aString = aItem.itemDescription;
                NSString *bString = bItem.itemDescription;
                NSInteger aInt = [aString rangeOfString:text].location;
                NSInteger bInt = [bString rangeOfString:text].location;
                return aInt > bInt;
            }];
            
			completionHandler(sortedArray);
		});
	}];
}

- (void)getItemsInCartWithCompletionHandler:(ItemSearchCompletionHandler)completionHandler
{
	[ManagedObjectContext performBlock:^{
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"inCart == 1"];
		NSArray *privateObjects = [self entitiesInContext:ManagedObjectContext withPredicate:predicate];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjects];
			NSArray *finalResults = [Item MR_findAllWithPredicate:mainPredicate];
			completionHandler(finalResults);
		});
	}];
}

- (void)changeStatusInCartForItem:(Item *)item withCompletionHandler:(SaveCompletionHandler)completionHandler;
{
	[ManagedObjectContext MR_saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
		Item *localItem = [item MR_inContext:localContext];
        if (localItem.inCart == YES) {
            localItem.inCart = NO;
        } else {
            localItem.inCart = YES;
        }
    [ManagedObjectContext MR_saveToPersistentStoreAndWait];
	} completion:^(BOOL contextDidSave, NSError * _Nullable error) {
		completionHandler(contextDidSave);
    }];
}

- (void)getItemsWithCompletionHandler:(ItemSearchCompletionHandler)completionHandler 
{
	[ManagedObjectContext performBlock:^{
		NSArray *privateObjects = [Item MR_findAllInContext:ManagedObjectContext];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjects];
			NSArray *finalResults = [Item MR_findAllWithPredicate:mainPredicate];
			completionHandler(finalResults);
		});
	}];
}


#pragma mark - Utils

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
