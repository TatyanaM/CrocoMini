//
//  SearchViewController.m
//  CrocoMini
//
//  Created by Tatiana Mudryak on 30/11/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) LoadingView *loadingView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// adjust UI
	[self addTableView];
	self.loadingView = [LoadingView loadingViewWithMessage:@"Загружаю данные..."];
	[self.view addSubview:self.loadingView];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	// load data
	[self loadingView];

	// update view constraints
	[self.view setNeedsUpdateConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadItems
{
	[self.view bringSubviewToFront:self.loadingView];
	
}


#pragma mark - UI

- (void)addTableView
{
	self.tableView = [[UITableView alloc] init];
	self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
	[self.view addSubview:self.tableView];
}


#pragma mark - Constraints

- (void)updateViewConstraints
{
	[self.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(@(LoadingViewWidth));
		make.height.equalTo(@(LoadingViewHeight));
		make.center.equalTo(self.view);
	}];

	[self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.and.left.equalTo(self.view);
		make.top.equalTo(self.view);
		make.bottom.equalTo(self.view);
	}];

	[super updateViewConstraints];
}


@end
