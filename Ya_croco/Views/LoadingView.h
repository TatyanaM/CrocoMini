//
//  LoadingView.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 Представление для индикации загрузки
 */
@interface LoadingView : UIView

/**
 Отображает индикатор загрузки с заданным сообщением

 @param message сообщение
 @return экземпляр LoadingView
 */
+ (instancetype)loadingViewWithMessage:(NSString *)message;


@end
