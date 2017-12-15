//
//  ItemsTableViewDataSource.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@protocol ItemCellDelegate <NSObject>

-(void)changeStatusInCartForItem:(Item *)item;

@end

@interface ItemsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id <ItemCellDelegate> delegate;

@property (nonatomic, strong) NSArray<Item *> *items;
@property (nonatomic, strong) NSArray *filteredItems;
@property (nonatomic) BOOL searchEnabled;

@end
