//
//  MainViewController.m
//  CrocoMini
//
//  Created by Tatiana Mudryak on 30/11/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UITabBarControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	UIViewController *initViewContoller = self.selectedViewController;
	if (initViewContoller)
	{
		self.navigationItem.title = initViewContoller.title;
	}

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - UITabBarControllerDelegate

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
	self.navigationItem.title = viewController.title;
}

@end
