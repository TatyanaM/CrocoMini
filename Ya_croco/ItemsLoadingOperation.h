//
//  ItemsLoadingOperation.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "BaseOperation.h"

@protocol ItemsLoadingOperationDelegate <NSObject>

@required
- (void)itemsLoadingFailedWithError:(NSString *)error;
- (void)itemsLoadingFinishedWithResult:(NSArray *)result;

@end


@interface ItemsLoadingOperation : BaseOperation

@property (nonatomic, assign) id <ItemsLoadingOperationDelegate> delegate;

@end
