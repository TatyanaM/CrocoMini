//
//  ItemsSearchBar.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsSearchBar.h"

@implementation ItemsSearchBar

-(instancetype)initWithDelegate:(id <UISearchBarDelegate>)delegate
{
	self = [super init];
	if (self)
	{
		self.delegate = delegate;
		self.placeholder = @"Введите наименование продукта";
	}
	return self;
}


@end
