//
//  NetworkAPI.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ItemCompletionHandler)(id items, NSError *error);

@interface NetworkAPI : NSObject

- (instancetype)initWithRequest:(NSURLRequest *)request;
- (NSArray *)startLoadingWithResponce:(NSURLResponse **)response error:(NSError **)error;


@end
