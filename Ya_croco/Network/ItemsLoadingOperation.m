//
//  ItemsLoadingOperation.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "ItemsLoadingOperation.h"
#import "LoadingManager.h"

static NSString * const itemsDefaultURL = @"http://api.edadev.ru/intern";

@implementation ItemsLoadingOperation

- (void)main
{
	LoadingManager *networkWrapper = [LoadingManager new];
	NSURL *URL = [NSURL URLWithString:itemsDefaultURL];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	//[networkWrapper loadItemsWithRequest:request];
}

@end
