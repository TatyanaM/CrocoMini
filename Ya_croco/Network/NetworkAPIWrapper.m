//
//  NetworkAPIWrapper.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "NetworkAPIWrapper.h"
#import "NetworkAPI.h"

#define itemsURL @"http://api.edadev.ru/intern"

@implementation NetworkAPIWrapper

-(void)loadItems
{
	NSError *error = nil;
	NSHTTPURLResponse *response = nil;

	NSURL *URL = [NSURL URLWithString:itemsURL];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	NetworkAPI *networkAPI = [[NetworkAPI alloc] initWithRequest:request];
	NSArray *items = [networkAPI startLoadingWithResponce:&response error:&error];
	NSLog(@"%@", items);
	
}

@end
