//
//  ItemCell.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemCell.h"

static CGFloat const ItemCellTopOffset = 8.0;
static CGFloat const ItemCellLeftOffset = 20.0;
static CGFloat const ItemCellRightOffset = 20.0;
static CGFloat const ItemCellBettweenElementsOffset = 12.0;
static CGFloat const ItemCellImageViewWidth = 40.0;
static CGFloat const ItemCellButtonWidth = 30.0;

@interface ItemCell ()

@property (nonatomic, strong) NSMutableArray *fields;

@property (nonatomic, strong, readwrite) UILabel *itemDescriptionLabel;
@property (nonatomic, strong, readwrite) UILabel *retailerLabel;
@property (nonatomic, strong, readwrite) UILabel *priceLabel;
@property (nonatomic, strong, readwrite) UILabel *discountLabel;
@property (nonatomic, strong, readwrite) UIImageView *itemImageView;


@end

@implementation ItemCell

+ (NSString *)reuseIdentifier
{
	return NSStringFromClass([self class]);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		_itemDescriptionLabel = [UILabel new];
		_itemDescriptionLabel.numberOfLines = 0;
		_itemDescriptionLabel.font = FontMedium(14);
		[self.contentView addSubview:_itemDescriptionLabel];

		_itemImageView = [UIImageView new];
		_itemImageView.contentMode = UIViewContentModeScaleAspectFill;
		_itemImageView.clipsToBounds = YES;
		[self.contentView addSubview:_itemImageView];

		_retailerLabel = [UILabel new];
		_retailerLabel.numberOfLines = 0;
		_retailerLabel.font = FontThin(12);
		[self.contentView addSubview:_retailerLabel];

		_priceLabel = [UILabel new];
		_priceLabel.numberOfLines = 1;
		_priceLabel.textAlignment = NSTextAlignmentLeft;
		_priceLabel.font = FontRegular(10);
		[self.contentView addSubview:_priceLabel];

		_discountLabel = [UILabel new];
		_priceLabel.numberOfLines = 1;
		_priceLabel.textAlignment = NSTextAlignmentLeft;
		_discountLabel.font = FontRegular(10);
		[self.contentView addSubview:_discountLabel];

        _addToCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[self.contentView addSubview:_addToCartButton];
	}
	return self;
}

-(void)updateCell
{
    if (self.inCart) {
        [_addToCartButton setImage:[UIImage imageNamed:@"removeFromCart"] forState:UIControlStateNormal];
    } else {
        [_addToCartButton setImage:[UIImage imageNamed:@"addToCart"] forState:UIControlStateNormal];
    }
}

#pragma mark - Constraint

- (void)updateConstraints
{
	[self.itemImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.contentView).offset(ItemCellTopOffset);
		make.right.equalTo(self.contentView).offset(-ItemCellRightOffset);
		make.width.and.height.equalTo(@(ItemCellImageViewWidth));
	}];

	[self.itemDescriptionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.contentView).offset(ItemCellTopOffset);
		make.left.equalTo(self.contentView).offset(ItemCellLeftOffset);
		make.right.equalTo(self.itemImageView.mas_left).offset(-ItemCellBettweenElementsOffset);
		make.height.equalTo(@([self heightForLabel:self.itemDescriptionLabel]));
	}];

	[self.retailerLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.itemDescriptionLabel.mas_bottom).offset(ItemCellBettweenElementsOffset);
		make.left.equalTo(self.contentView).offset(ItemCellLeftOffset);
		make.width.equalTo(self.itemDescriptionLabel);
		make.height.equalTo(@([self heightForLabel:self.retailerLabel]));
	}];

	[self.priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.retailerLabel.mas_bottom).offset(ItemCellBettweenElementsOffset);
		make.left.equalTo(self.contentView).offset(ItemCellLeftOffset);
		make.width.equalTo(self.itemDescriptionLabel.mas_width).multipliedBy(0.3);
		make.bottom.equalTo(self.contentView).offset(-ItemCellTopOffset);
	}];

	[self.discountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.retailerLabel.mas_bottom).offset(ItemCellBettweenElementsOffset);
		make.left.equalTo(self.priceLabel.mas_right).offset(ItemCellBettweenElementsOffset);
		make.width.equalTo(self.itemDescriptionLabel.mas_width).multipliedBy(0.3);
		make.bottom.equalTo(self.contentView).offset(-ItemCellTopOffset);
	}];

	[self.addToCartButton mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(self).offset(-ItemCellRightOffset);
		make.bottom.equalTo(self).offset(-ItemCellTopOffset);
		make.width.and.height.equalTo(@(ItemCellButtonWidth));
	}];

    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(self);
        make.top.and.bottom.equalTo(self);
        make.height.greaterThanOrEqualTo(@120);
    }];
    
	[super updateConstraints];
}

- (CGFloat)heightForLabel:(UILabel *)label
{
	CGSize labelSize =  [label.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width, MAXFLOAT)
												  options:NSStringDrawingUsesLineFragmentOrigin
											   attributes:@{ NSFontAttributeName : label.font }
												  context:nil].size;
	return labelSize.height;
}

@end
