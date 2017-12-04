//
//  BaseLoadingOperation.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseLoadingOperation : NSOperation

// стартуем операцию
+ (BOOL)performStartWithConfigBlock:(void(^)(id chain))configBlock returningError:(NSError **)error;

@end
