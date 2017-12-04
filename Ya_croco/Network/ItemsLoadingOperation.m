//
//  ItemsLoadingOperation.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsLoadingOperation.h"
#import "NetworkAPIWrapper.h"

@implementation ItemsLoadingOperation

- (void)main
{

	NetworkAPIWrapper *networkWrapper = [NetworkAPIWrapper new];
	[networkWrapper loadItems];
}

@end
