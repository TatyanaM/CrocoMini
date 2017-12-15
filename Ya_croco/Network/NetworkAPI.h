//
//  NetworkAPI.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResponseCompletionHandler)(id item, NSError *error);

/**
 Класс для отправки сетевых запросов
 */
@interface NetworkAPI : NSObject

/**
 Возвращает экземпляр NetworkAPI

 @param request URL запрос
 @return экземпляр NetworkAPI
 */
-(instancetype)initWithRequest:(NSURLRequest *)request;

/**
 Выполянет синхронный URL-запрос

 @param urlString URL адрес
 @param params параметры
 @return ответ сервера
 */
+(id)startSyncLoadingWithURL:(NSString *)urlString params:(NSDictionary *)params;

@end
