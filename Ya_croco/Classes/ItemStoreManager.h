//
//  ItemStoreManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemStoreManagerDelegate.h"
#import "Item.h"

typedef void (^ItemSearchCompletionHandler)(NSArray *items);
typedef void (^SaveCompletionHandler)(BOOL finished);

@protocol ItemStoreManagerDelegate;


/**
 Класс-менеджер хранения продуктов в БД
 */
@interface ItemStoreManager : NSObject


+ (instancetype)sharedManager;

/**
 Создает обьекты типа Item с заданными данными

 @param items массив NSDictionary с набором данных для каждого обьекта Item
 @return массив обьектов Item
 */
- (NSArray *)createItemsWithData:(NSArray *)items;

/**
 Возвращает все продукты

 @param completionHandler список продуктов
 */
- (void)getItemsWithCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

/**
 Ищет все продукты, в описании которых есть заданная поисковая строка

 @param text текст поиска
 @param completionHandler список продуктов
 */
- (void)foundItemWithText:(NSString *)text andCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

/**
 Возвращает все продукты, помещенные в корзину

 @param completionHandler список продуктов
 */
- (void)getItemsInCartWithCompletionHandler:(ItemSearchCompletionHandler)completionHandler;

/**
 Меняет статус продукта при добавлении его в корзину и удалении из нее

 @param item продукт
 @param completionHandler флаг успешности операции
 */
- (void)changeStatusInCartForItem:(Item *)item withCompletionHandler:(SaveCompletionHandler)completionHandler;

@end
