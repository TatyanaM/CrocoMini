//
//  Item+CoreDataProperties.h
//  
//
//  Created by Tatiana Mudryak on 04/12/2017.
//
//

#import "Item+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *itemDescription;
@property (nonatomic) double price;
@property (nonatomic) double discount;
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *retailer;

@end

NS_ASSUME_NONNULL_END
