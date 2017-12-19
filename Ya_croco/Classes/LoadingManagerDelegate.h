//
//  LoadingManagerDelegate.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол менеджера загрузки
 */
@protocol LoadingManagerDelegate <NSObject>

/**
 Вызывается, если загрузка завершена с ошибкой

 @param error описание ошибки
 */
-(void)loadingFinishedWithError:(NSString *)error;

/**
 Вызывается при успешно завершенной загрузке

 @param items массив обьектов
 */
-(void)itemsLoaded:(NSArray *)items;

@end
