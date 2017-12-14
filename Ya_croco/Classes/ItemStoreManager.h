//
//  ItemStoreManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemStoreManagerDelegate.h"

typedef void (^ItemSearchCompletionHandler)(NSArray *items);

@protocol ItemStoreManagerDelegate;


@interface ItemStoreManager : NSObject 

+ (instancetype)sharedManager;


- (NSArray *)createItemsWithData:(NSArray *)items;

- (void)foundItemWithText:(NSString *)text andCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

@end
