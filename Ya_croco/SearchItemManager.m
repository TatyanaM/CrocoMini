//
//  SearchItemManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "SearchItemManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Item+CoreDataClass.h"

@implementation SearchItemManager

- (NSArray *)searchItemsWithSubstring:(NSString *)string
{
	NSPredicate *predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", @".*%@.*", string];
	NSArray *items = [Item MR_findAllWithPredicate:predicate inContext:ManagedObjectContext];
	return items;
}

#pragma mark - UISearchBarDelegate

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	if (searchText.length > 2) {
		NSArray *filteredItems = [self searchItemsWithSubstring:searchText];
		if ([self.delegate respondsToSelector:@selector(searchFinishedWithResult:)])
			[self.delegate searchFinishedWithResult:filteredItems];
	}
}

@end
