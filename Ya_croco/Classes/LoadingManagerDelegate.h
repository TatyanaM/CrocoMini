//
//  LoadingManagerDelegate.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoadingManagerDelegate <NSObject>

-(void)loadingFinishedWithError:(NSString *)error;
-(void)itemsLoaded:(NSArray *)items;

@end
