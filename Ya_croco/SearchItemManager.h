//
//  SearchItemManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchItemManagerDelegate <NSObject>

-(void)searchFinishedWithResult:(NSArray *)result;

@end


@interface SearchItemManager : NSObject <UISearchBarDelegate>

@property (nonatomic, assign) id <SearchItemManagerDelegate> delegate;

-(NSArray *)searchItemsWithSubstring:(NSString *)string;

@end
