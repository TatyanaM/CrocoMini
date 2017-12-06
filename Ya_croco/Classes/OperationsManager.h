//
//  OperationsManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperationsManager : NSObject

// Очередь для операций
@property (nonatomic, strong) NSOperationQueue *operationsQueue;

+ (instancetype)sharedManager;

@end
