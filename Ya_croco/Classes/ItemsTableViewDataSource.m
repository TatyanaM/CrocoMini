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
#import <AFNetworking/UIImageView+AFNetworking.h>


@implementation ItemsTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ItemCell *newCell = [tableView dequeueReusableCellWithIdentifier:[ItemCell reuseIdentifier]];
	if (!newCell)
	{
		newCell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[ItemCell reuseIdentifier]];
	}
	newCell.selectionStyle = UITableViewCellSelectionStyleNone;
	[self configuteCell:newCell atIndexPath:indexPath];
	return newCell;
}

- (void)configuteCell:(ItemCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	Item *item = [self itemWithIndex:indexPath.row];
	cell.itemDescriptionLabel.text = item.itemDescription;
	cell.retailerLabel.text = [NSString stringWithFormat:@"Продавец: %@", item.retailer];
	cell.priceLabel.text = [NSString stringWithFormat:@"Цена: %.2f", item.price];
	cell.discountLabel.text = [NSString stringWithFormat:@"Скидка: %.2f", item.discount];
	[cell.itemImageView setImageWithURL:[NSURL URLWithString:item.imageURL] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
	cell.inCart = item.inCart;

	cell.addToCartButton.tag = indexPath.row;
	[cell.addToCartButton addTarget:self action:@selector(cartButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
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

-(void)cartButtonClicked:(UIButton *)sender
{
	Item *changedItem = [self itemWithIndex:sender.tag];
	if ([self.delegate respondsToSelector:@selector(changeStatusInCartForItem:)]) {
		[self.delegate changeStatusInCartForItem:changedItem];
	}
}

- (Item *)itemWithIndex:(NSInteger)index
{
	return self.searchEnabled ? [self.filteredItems objectAtIndex:index] : [self.items objectAtIndex:index];
}

@end
