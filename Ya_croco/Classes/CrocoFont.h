//
//  CrocoFont.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *FontThinName;
extern NSString *FontMediumName;
extern NSString *FontRegularName;

#define FontThin(SIZE)     [CrocoFont fontWithName:FontThinName size:(SIZE)]
#define FontMedium(SIZE)   [CrocoFont fontWithName:FontMediumName size:(SIZE)]
#define FontRegular(SIZE)  [CrocoFont fontWithName:FontRegularName size:(SIZE)]

@interface CrocoFont : UIFont

@end
