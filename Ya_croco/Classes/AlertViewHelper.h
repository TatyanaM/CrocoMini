//
//  AlertViewHelper.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 10.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Класс-помощник для отображения стандартного алерта с заданным заголовком и сообщением
 */
@interface AlertViewHelper : NSObject

/**
 Возвращает экземпляр UIAlertController с заданным заголовком и сообщением

 @param title заголовок
 @param message сообщение
 @return экземпляр UIAlertController
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
