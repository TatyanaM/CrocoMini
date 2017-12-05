//
//  Item.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic) double price;
@property (nonatomic) double discount;
@property (nonatomic, copy) NSString *retailer;

@end
