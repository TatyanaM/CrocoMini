//
//  ItemsLoadingOperation.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemsLoadingOperationDelegate <NSObject>

@required
- (void)itemsLoadingFailedWithError:(NSError *)error;
- (void)itemsLoadingFinishedWithResult:(NSArray *)result;

@end


/**
 Операция для загрузки списка товаров
 */
@interface ItemsLoadingOperation : NSOperation

@property (nonatomic, assign) id <ItemsLoadingOperationDelegate> delegate;

@end
