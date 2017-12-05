//
//  ItemCell.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemCell.h"

NSString *const ItemCellIdentifier = @"ItemCellIdentifier";

@implementation ItemCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)configureCell
{
	self.textLabel.text = self.item.itemDescription;
}

@end
