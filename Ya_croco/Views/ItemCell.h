//
//  ItemCell.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const ItemCellIdentifier;

@interface ItemCell : UITableViewCell

@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *retailer;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) UIImage *itemImage;
@property (nonatomic) BOOL itemInCart;

@end
