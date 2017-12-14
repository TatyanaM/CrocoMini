//
//  BaseLoadingOperation.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingOperationsDelegate.h"

@protocol LoadingOperationsDelegate;

/**
 Base operation class
 */
@interface BaseLoadingOperation : NSOperation

@property (nonatomic, assign) id <LoadingOperationsDelegate> delegate;

@end
