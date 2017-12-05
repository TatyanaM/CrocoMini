//
//  ItemCell.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemCell.h"

NSString *const ItemCellIdentifier = @"ItemCellIdentifier";

@interface ItemCell ()

@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *retailerLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UIButton *cartButton;

@end

@implementation ItemCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)configureCell
{
	self.textLabel.text = self.item.itemDescription;
}

-(void)updateConstraints
{
	
	[super updateConstraints];
}

@end
