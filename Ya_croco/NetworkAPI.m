//
//  NetworkAPI.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "NetworkAPI.h"
#import <AFNetworking/AFNetworking.h>

@interface NetworkAPI ()

@property (nonatomic, strong) NSURLRequest *request;

@end

@implementation NetworkAPI

- (instancetype)initWithRequest:(NSURLRequest *)request
{
	self = [super init];
	if (self)
	{
		_request = request;
	}

	return self;
}

- (NSArray *)startLoadingWithResponce:(NSURLResponse **)response error:(NSError **)error
{
	__block NSArray *data = nil;

	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

	NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:self.request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
		if (error) {
			//error = responseObject;
		} else {
			if ([responseObject isKindOfClass:[NSArray class]])
				data = responseObject;
		}
	}];
	[dataTask resume];
	return data;
}

@end
