//
//  CrocoFont.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "CrocoFont.h"

NSString *FontThinName;
NSString *FontMediumName;
NSString *FontRegularName;

@implementation CrocoFont

+ (void)initialize
{
	if ([[UIDevice currentDevice].systemVersion floatValue] < 9.0)
	{
		FontThinName	= @"HelveticaNeue-Thin";
		FontMediumName	= @"HelveticaNeue-Medium";
		FontRegularName	= @"HelveticaNeue-Regular";
	}
	else
	{
		FontThinName	= [UIFont systemFontOfSize:30 weight:UIFontWeightThin].fontName;
		FontMediumName	= [UIFont systemFontOfSize:30 weight:UIFontWeightMedium].fontName;
		FontRegularName	= [UIFont systemFontOfSize:30 weight:UIFontWeightRegular].fontName;
	}
}

@end
