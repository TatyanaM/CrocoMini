//
//  ItemsLoadingOperation.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "BaseLoadingOperation.h"

@protocol ItemsLoadingOperationDelegate <NSObject>

@required
- (void)itemsLoadingFailedWithError:(NSError *)error;
- (void)itemsLoadingFinishedWithResult:(NSArray *)result;

@end


/**
 Операция для загрузки списка товаров
 */
@interface ItemsLoadingOperation : BaseLoadingOperation

@property (nonatomic, assign) id <ItemsLoadingOperationDelegate> delegate;

@end
