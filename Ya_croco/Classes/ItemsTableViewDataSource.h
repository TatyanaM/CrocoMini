//
//  ItemsTableViewDataSource.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item+CoreDataClass.h"

@interface ItemsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray<Item *> *items;

@end
