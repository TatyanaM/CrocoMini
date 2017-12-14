//
//  ItemsTableViewDataSource.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsTableViewDataSource.h"
#import "ItemCell.h"
#import "Item.h"

@implementation ItemsTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ItemCell *newCell = [tableView dequeueReusableCellWithIdentifier:[ItemCell reuseIdentifier]];
	if (!newCell)
	{
		newCell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[ItemCell reuseIdentifier]];
	}

	[self configuteCell:newCell atIndexPath:indexPath];
	return newCell;
}

- (void)configuteCell:(ItemCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	Item *item = self.searchEnabled ? [self.filteredItems objectAtIndex:indexPath.row] : [self.items objectAtIndex:indexPath.row];
	cell.itemDescriptionLabel.text = item.itemDescription;
	cell.retailerLabel.text = item.retailer;
	cell.priceLabel.text = [NSString stringWithFormat:@"%f.2", item.price];
	cell.discountLabel.text = [NSString stringWithFormat:@"%f.2", item.discount];

	[cell setNeedsUpdateConstraints];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (self.searchEnabled) {
		return self.filteredItems.count;
	} else {
		return self.items.count;
	}
}

@end
