//
//  ItemStoreManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemStoreManagerDelegate.h"
#import "Item.h"

typedef void (^ItemSearchCompletionHandler)(NSArray *items);
typedef void (^SaveCompletionHandler)(BOOL finished);

@protocol ItemStoreManagerDelegate;


@interface ItemStoreManager : NSObject 

+ (instancetype)sharedManager;


- (void)getItemsWithCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

- (NSArray *)createItemsWithData:(NSArray *)items;

- (void)foundItemWithText:(NSString *)text andCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

- (void)getItemsInCartWithCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

- (void)changeStatusInCartForItem:(Item *)item withCompletionHandler:(SaveCompletionHandler)completionHandler;

@end
