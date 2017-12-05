//
//  ItemCell.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

extern NSString *const ItemCellIdentifier;

@interface ItemCell : UITableViewCell

@property (nonatomic, strong) Item *item;
-(void)configureCell;

@end
