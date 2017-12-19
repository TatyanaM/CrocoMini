//
//  ItemsTableViewDataSource.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

/**
 Протокол ячейки отображения продукта
 */
@protocol ItemCellDelegate <NSObject>

/**
 Меняет статус продукта (в коризине/ не в корзине)

 @param item изменяемый продукт
 */
-(void)changeStatusInCartForItem:(Item *)item;

@end

/**
 Источник данных для отображения списка продуктов
 */
@interface ItemsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id <ItemCellDelegate> delegate;

/**
 Список продуктов
 */
@property (nonatomic, strong) NSArray<Item *> *items;

/**
 Список продуктов по результатам поиска
 */
@property (nonatomic, strong) NSArray *filteredItems;

/**
 Флаг включения/отключения режима поиска
 */
@property (nonatomic) BOOL searchEnabled;

@end
