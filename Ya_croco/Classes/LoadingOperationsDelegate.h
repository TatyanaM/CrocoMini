//
//  LoadingOperationsDelegate.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол работы операции загрузки данных
 */
@protocol LoadingOperationsDelegate <NSObject>

/**
 Вызывается в случае, если загрузка не удалась

 @param error описание ошибки
 */
- (void)loadingFailedWithError:(NSString *)error;

/**
 Вызывается при успешном завершении загрузки

 @param result массив с данными ответа сервера
 */
- (void)loadingFinishedWithResult:(NSArray *)result;


@end
