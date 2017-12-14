//
//  LoadingManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "LoadingManager.h"
#import "BaseLoadingOperation.h"
#import "ItemStoreManager.h"
#import "OperationsManager.h"


static NSString *const wrongDataFormatError = @"Ошибка загрузки данных";

@implementation LoadingManager

-(void)loadItems
{
	BaseLoadingOperation *operation = [[OperationsManager sharedManager] operationWithType:Items];
	operation.delegate = self;
	[[OperationsManager sharedManager].operationsQueue addOperation:operation];
}

#pragma mark - LoadingOperationDelegate

-(void)loadingFailedWithError:(NSString *)error
{
	dispatch_async(dispatch_get_main_queue(), ^{
		if ([self.delegate respondsToSelector:@selector(loadingFinishedWithError:)])
			[self.delegate loadingFinishedWithError:error];
	});
}

-(void)loadingFinishedWithResult:(NSArray *)result
{
	NSArray *items = [[ItemStoreManager sharedManager] createItemsWithData:result];
	dispatch_async(dispatch_get_main_queue(), ^{
		if ([self.delegate respondsToSelector:@selector(itemsLoaded:)])
			[self.delegate itemsLoaded:items];
	});
}

@end
