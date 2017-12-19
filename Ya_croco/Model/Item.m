//
//  Item.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "Item.h"
#include "Ya_croco+CoreDataModel.h"

@implementation Item

@dynamic itemDescription;
@dynamic price;
@dynamic discount;
@dynamic imageURL;
@dynamic retailer;

+(NSEntityDescription *)MR_entityDescriptionInContext:(NSManagedObjectContext *)context
{

}

//+(NSEntityDescription *)MR_entityDescription
//{
//	NSEntityDescription *product = makeDbEntity(@"Item", @[
//														   makeDbAttr(@"itemDescription",              NSStringAttributeType, nil),
//														   makeDbAttr(@"name",             NSStringAttributeType, nil),
//														   makeDbAttr(@"smsName",          NSStringAttributeType, nil),
//														   makeDbAttr(@"descript",         NSStringAttributeType, nil),
//														   ]);

//	return product;
//}

@end
