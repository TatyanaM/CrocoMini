//
//  Item+CoreDataProperties.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//
//

#import "Item.h"


NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest;

@property (nonatomic) double discount;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, copy) NSString *itemDescription;
@property (nonatomic) double price;
@property (nullable, nonatomic, copy) NSString *retailer;
@property (nonatomic) BOOL inCart;

@end

NS_ASSUME_NONNULL_END
