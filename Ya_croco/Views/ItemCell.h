//
//  ItemCell.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 14/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Ячейка продукта
 */
@interface ItemCell : UITableViewCell

+ (NSString *)reuseIdentifier;


@property (nonatomic, strong, readonly) UILabel *itemDescriptionLabel;	/** Описание продукта */
@property (nonatomic, strong, readonly) UILabel *retailerLabel; 		/** Продавец */
@property (nonatomic, strong, readonly) UILabel *priceLabel;			/** Цена */
@property (nonatomic, strong, readonly) UILabel *discountLabel;			/** Скидка */
@property (nonatomic, strong, readonly) UIImageView *itemImageView;		/** Картинка продукта */
@property (nonatomic) BOOL inCart;										/** Флаг "в корзине" */
@property (nonatomic, strong) UIButton *addToCartButton;				/** Кнопка добавления и удаления из корзины */

@end
