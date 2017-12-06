//
//  ItemStoreManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Class for managing database item objects
 */
@interface ItemStoreManager : NSObject

/**
 Method parses JSON and creates objects of type Item

 @param items array of dictionary from JSON
 @return array objects of type Item
 */
+(NSArray *)createItemsWithData:(NSArray *)items;

@end
