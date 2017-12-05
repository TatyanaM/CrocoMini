//
//  LoadingManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ItemCompletionHandler)(id items, NSError *error);

@protocol LoadingManagerDelegate <NSObject>
@required
-(void)loadingFinishedWithError:(NSString *)error;
-(void)itemsLoaded:(NSArray *)items;

@end

@interface LoadingManager : NSObject


@property (nonatomic, assign) id <LoadingManagerDelegate> delegate;

-(void)loadItems;//WithRequest:(NSURLRequest *)request;

@end
