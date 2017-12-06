//
//  LoadingManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "LoadingManager.h"
#import "ItemsLoadingOperation.h"
#import "ItemStoreManager.h"
#import "OperationsManager.h"


static NSString *const wrongDataFormatError = @"Ошибка загрузки данных";


@implementation LoadingManager

-(void)loadItems
{
	ItemsLoadingOperation *operation = [ItemsLoadingOperation new];
	operation.delegate = self;
	[[OperationsManager sharedManager].operationsQueue addOperation:operation];
}

#pragma mark - ItemsLoadingOperationDelegate

-(void)itemsLoadingFailedWithError:(NSString *)error
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.delegate loadingFinishedWithError:error];
	});
}

-(void)itemsLoadingFinishedWithResult:(NSArray *)result
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.delegate itemsLoaded:result];
	});
}

@end
