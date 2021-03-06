//
//  OperationsManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "OperationsManager.h"
#import "ItemsLoadingOperation.h"

@implementation OperationsManager

+ (instancetype)sharedManager
{
	static OperationsManager *sharedOperationsManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedOperationsManager = [OperationsManager new];
	});
	return sharedOperationsManager;
}

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_operationsQueue = [NSOperationQueue new];
		_operationsQueue.name = @"Base.OperationsQueue";
	}

	return self;
}

- (id<LoadingOperationsDelegate>)operationWithType:(LoadingOperationType)type
{
	id operation = nil;
	switch (type) {
		case Items:
			operation = [[ItemsLoadingOperation alloc] init];
			break;

		case Other:
			return nil;
			break;
	}
	return operation;
}


@end
