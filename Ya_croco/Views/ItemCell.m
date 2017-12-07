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

-(void)setItemDescription:(NSString *)itemDescription
{
	_itemDescription = itemDescription;
	self.descriptionLabel.text = _itemDescription;
}

-(void)setPrice:(NSString *)price
{
	_price = price;
	self.priceLabel.text = _price;
}

-(void)setDiscount:(NSString *)discount
{
	_discount = discount;
	self.descriptionLabel.text = _discount;
}

-(void)setRetailer:(NSString *)retailer
{
	_retailer = retailer;
	self.retailerLabel.text = retailer;
}



-(void)updateConstraints
{
	
	[super updateConstraints];
}

@end
