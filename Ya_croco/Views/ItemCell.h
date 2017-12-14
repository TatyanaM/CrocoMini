//
//  ItemCell.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCellDelegate.h"

@protocol ItemCellDelegate;

@interface ItemCell : UITableViewCell

+ (NSString *)reuseIdentifier;

@property (nonatomic, weak) id <ItemCellDelegate> delegate;

@property (nonatomic, strong, readonly) UILabel *itemDescriptionLabel;
@property (nonatomic, strong, readonly) UILabel *retailerLabel;
@property (nonatomic, strong, readonly) UILabel *priceLabel;
@property (nonatomic, strong, readonly) UILabel *discountLabel;
@property (nonatomic, strong, readonly) UIImageView *itemImageView;
@property (nonatomic) BOOL inCart;

@end
