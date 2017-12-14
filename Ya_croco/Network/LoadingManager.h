//
//  LoadingManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingManagerDelegate.h"
#import "LoadingOperationsDelegate.h"

typedef void (^ItemCompletionHandler)(id items, NSError *error);

@protocol LoadingManagerDelegate;


@interface LoadingManager : NSObject <LoadingOperationsDelegate>

@property (nonatomic, weak) id <LoadingManagerDelegate> delegate;

-(void)loadItems;

@end
