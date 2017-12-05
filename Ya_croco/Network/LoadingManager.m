//
//  LoadingManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "LoadingManager.h"
#import "NetworkAPI.h"
#import "ItemStoreManager.h"

static NSString *const wrongDataFormatError = @"Ошибка загрузки данных";
static NSString * const itemsDefaultURL = @"http://api.edadev.ru/intern";

@implementation LoadingManager

-(void)loadItems//WithRequest:(NSURLRequest *)request
{
	NSURL *URL = [NSURL URLWithString:itemsDefaultURL];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	NetworkAPI *networkAPI = [[NetworkAPI alloc] initWithRequest:request];
	[networkAPI startLoadingWithCompletionHandler:^(id item, NSError *error) {
		if (error)
		{
			[self.delegate loadingFinishedWithError:error.description];
		} else
		{
			if ([item isKindOfClass:[NSArray class]]) {
				[self handleReceivedItems:(NSArray *)item];
			} else {
				[self.delegate loadingFinishedWithError:wrongDataFormatError];
			}
		}
	}];
}

-(void)handleReceivedItems:(NSArray *)items
{
	ItemStoreManager *itemManager = [ItemStoreManager new];
	NSArray *resultItems = [itemManager createItemsWithData:items];
	[self.delegate itemsLoaded:resultItems];
}

@end
