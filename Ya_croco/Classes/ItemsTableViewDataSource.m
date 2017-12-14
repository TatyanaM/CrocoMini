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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ItemCell *newCell = [tableView dequeueReusableCellWithIdentifier:ItemCellIdentifier];
	if (!newCell)
	{
		newCell = [[ItemCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ItemCellIdentifier];
	}

	Item *item = nil;
	if (self.searchEnabled) {
		item = [self.filteredItems objectAtIndex:indexPath.row];
	} else {
		item = [self.items objectAtIndex:indexPath.row];
	}

	return newCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (self.searchEnabled) {
		return self.filteredItems.count;
	} else {
		return self.items.count;
	}
}

@end
