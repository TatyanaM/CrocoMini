//
//  ItemsLoadingOperation.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsLoadingOperation.h"
#import "NetworkAPI.h"
#import "ItemStoreManager.h"

static NSString * const itemsDefaultURL = @"http://api.edadev.ru/intern";

@implementation ItemsLoadingOperation

@synthesize delegate;

-(void)main
{
	NSString *error = nil;
	id data = [NetworkAPI startSyncLoadingWithURL:itemsDefaultURL params:nil error:error];
	if ([data isKindOfClass:[NSArray class]])
	{
		NSArray *itemsArray = data;
		if (itemsArray)
		{
			NSArray *items = [ItemStoreManager createItemsWithData:itemsArray];
			[self.delegate itemsLoadingFinishedWithResult:items];
		} else
		{
			[self.delegate itemsLoadingFailedWithError:error];
		}
	}


}

@end
