//
//  ItemsTableViewDataSource.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsTableViewDataSource.h"
#import "ItemCell.h"

@implementation ItemsTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ItemCell *newCell = [tableView dequeueReusableCellWithIdentifier:ItemCellIdentifier];
	if (!newCell)
	{
		newCell = [[ItemCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ItemCellIdentifier];
	}
	newCell.item = [self.items objectAtIndex:indexPath.row];
	[newCell configureCell];
	return newCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.items.count;
}

@end
