//
//  ItemCell.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemCell.h"

static CGFloat const ItemCellTopOffset = 8.0;
static CGFloat const ItemCellLeftOffset = 8.0;
static CGFloat const ItemCellRightOffset = 8.0;
static CGFloat const ItemCellBettweenElementsOffset = 8.0;
static CGFloat const ItemCellImageViewWidth = 8.0;

@interface ItemCell ()

@property (nonatomic, strong) NSMutableArray *fields;

@property (nonatomic, strong, readwrite) UILabel *itemDescriptionLabel;
@property (nonatomic, strong, readwrite) UILabel *retailerLabel;
@property (nonatomic, strong, readwrite) UILabel *priceLabel;
@property (nonatomic, strong, readwrite) UILabel *discountLabel;
@property (nonatomic, strong, readwrite) UIImageView *itemImageView;
@property (nonatomic, strong) UIButton *addToCartButton;

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
		_itemDescriptionLabel.font = FontThin(12);
		[self.contentView addSubview:_itemDescriptionLabel];

		_itemImageView = [UIImageView new];
		_itemImageView.contentMode = UIViewContentModeScaleAspectFill;
		[self.contentView addSubview:_itemImageView];

		_retailerLabel = [UILabel new];
		_retailerLabel.numberOfLines = 0;
		_retailerLabel.font = FontThin(10);
		[self.contentView addSubview:_retailerLabel];

		_priceLabel = [UILabel new];
		_priceLabel.numberOfLines = 1;
		_priceLabel.font = FontRegular(9);
		[self.contentView addSubview:_priceLabel];

		_discountLabel = [UILabel new];
		_priceLabel.numberOfLines = 1;
		_discountLabel.font = FontRegular(9);
		[self.contentView addSubview:_discountLabel];

		_addToCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_addToCartButton.imageView.image = [UIImage imageNamed:@"cart"];
		[_addToCartButton addTarget:self action:@selector(addToCart) forControlEvents:UIControlEventTouchUpInside];
		[self.contentView addSubview:_addToCartButton];
	}
	return self;
}

- (void)addToCart
{
	if ([self.delegate respondsToSelector:@selector(addItemToCart)]) {
		[self.delegate addItemToCart];
	}
}


#pragma mark - Constraint

- (void)updateConstraints
{
	// расчитываем отступ справа в завимости от того, есть картинка или нет
	CGFloat labelRightOffset = ItemCellRightOffset;
	if (self.itemImageView.image) {

		labelRightOffset += ItemCellImageViewWidth + ItemCellBettweenElementsOffset;

		[self.itemImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self.contentView).offset(ItemCellTopOffset);
			make.right.equalTo(self.contentView).offset(ItemCellRightOffset);

		}];
	}

	[self.itemDescriptionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.contentView).offset(ItemCellTopOffset);
		make.left.equalTo(self.contentView).offset(ItemCellLeftOffset);
		make.right.equalTo(self.contentView).offset(-labelRightOffset);
		//make.bottom.equalTo(self.retailerLabel).offset(ItemCellBettweenElementsOffset);
		make.height.equalTo(@([self heightForLabel:self.itemDescriptionLabel]));
	}];

	[self.retailerLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.itemDescriptionLabel).offset(ItemCellBettweenElementsOffset);
		make.left.equalTo(self.contentView).offset(ItemCellLeftOffset);
		make.width.equalTo(self.itemDescriptionLabel);
		//make.bottom.equalTo(self.priceLabel).offset(ItemCellBettweenElementsOffset);
		make.height.equalTo(@([self heightForLabel:self.retailerLabel]));
	}];

	[self.priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.contentView).offset(ItemCellLeftOffset);
		make.width.equalTo(self.itemDescriptionLabel.mas_width).multipliedBy(0.5);
		make.bottom.equalTo(self.contentView).offset(ItemCellBettweenElementsOffset);
	}];

	[self.discountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.priceLabel).offset(ItemCellLeftOffset);
		make.right.equalTo(self.addToCartButton).offset(ItemCellBettweenElementsOffset);
		make.bottom.equalTo(self.contentView).offset(ItemCellBettweenElementsOffset);
	}];

	[self.addToCartButton mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(self).offset(ItemCellRightOffset);
		make.bottom.equalTo(self).offset(ItemCellTopOffset);
		make.width.and.height.equalTo(@(ItemCellImageViewWidth));
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

//+ (CGFloat)cellHeightWithTitle:(NSString *)title andDescription:(NSString *)description width:(CGFloat)width
//{
//	CGFloat descriptionTextContainerWidth = width - CNFConstantPromoLabel*2;
//	CGSize descriptionTextContainer = CGSizeMake(descriptionTextContainerWidth, INFINITY);
//
//	CGFloat cellHeight = CNFConstantPromoLabel + (title.length > 0 ? CNFConstantPromoLabel : 0); // высота плюс верхний отступ
//	cellHeight += CNFConstantPromoLabel - 8 ;
//	cellHeight += ceil([description mySizeWithFont:SBFontMedium(15) constrainedToSize:descriptionTextContainer ].height); // высота лейбла
//	cellHeight += 8; // нижний отступ
//
//	return cellHeight;
//}

@end
