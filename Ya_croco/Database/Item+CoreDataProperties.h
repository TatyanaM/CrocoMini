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
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *itemDescription;
@property (nonatomic) double price;
@property (nullable, nonatomic, copy) NSString *retailer;

@end

NS_ASSUME_NONNULL_END
