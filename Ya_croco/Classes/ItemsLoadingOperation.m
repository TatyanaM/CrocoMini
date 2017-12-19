//
//  ItemsLoadingOperation.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsLoadingOperation.h"
#import "NetworkAPI.h"

static NSString * const itemsDefaultURL = @"http://api.edadev.ru/intern";

@implementation ItemsLoadingOperation

@synthesize delegate;

-(void)main
{
	NSString *error = nil;
	id data = [NetworkAPI startSyncLoadingWithURL:itemsDefaultURL params:nil];
	if (!self.cancelled)
	{
		if ([data isKindOfClass:[NSArray class]])
		{
			NSArray *itemsArray = data;
			if (itemsArray)
			{
				if ([self.delegate respondsToSelector:@selector(loadingFinishedWithResult:)])
					[self.delegate loadingFinishedWithResult:itemsArray];
			} else
			{
				if ([self.delegate respondsToSelector:@selector(loadingFailedWithError:)])
					[self.delegate loadingFailedWithError:error];
			}
		}
	}
}

@end
