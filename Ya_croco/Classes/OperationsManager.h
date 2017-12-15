//
//  OperationsManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingOperationsDelegate.h"

typedef enum LoadingOperationType  {
	Items,
	Other //something else
} LoadingOperationType;


/**
 Менеджер управления операциями
 */
@interface OperationsManager : NSObject

// Очередь для операций
@property (nonatomic, strong) NSOperationQueue *operationsQueue;

+ (instancetype)sharedManager;

/**
 Фабрика создания операций в зависимости от указанного типа

 @param  type тип выполняемой операции
 @return экземпляр операции нужного типа
 */
- (id<LoadingOperationsDelegate>)operationWithType:(LoadingOperationType)type;

@end
