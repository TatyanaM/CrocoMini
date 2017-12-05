//
//  SearchViewController.m
//  CrocoMini
//
//  Created by Tatiana Mudryak on 30/11/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "SearchViewController.h"
#import "ItemsLoadingOperation.h"
#import "SearchItemManager.h"
#import "LoadingManager.h"
#import "ItemsSearchBar.h"
#import "ItemsTableViewDataSource.h"

static NSString *const SearchViewControllerTitle = @"Поиск";

@interface SearchViewController () <LoadingManagerDelegate>

//data
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ItemsTableViewDataSource *tableViewDataSource;

//loading
@property (nonatomic, strong) LoadingView *loadingView;
@property (nonatomic, strong) LoadingManager *loadingManager;

//search
@property (nonatomic, strong) ItemsSearchBar *searchBar;
@property (nonatomic, strong) SearchItemManager *searchManager;
@property (nonatomic, strong) NSArray *filteredItems;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = SearchViewControllerTitle;

	self.searchManager = [SearchItemManager new];
	self.loadingManager = [LoadingManager new];
	self.loadingManager.delegate = self;

	// adjust UI
	[self addTableView];
	[self addLoadingView];
	[self addSearchBar];

	[self setupInitialData];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	// load items data
	[self loadItems];

	// update view constraints
	[self.view setNeedsUpdateConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadItems
{
	self.loadingView.hidden = NO;
	[self.loadingManager loadItems];
}

- (void)setupInitialData
{
	self.tableViewDataSource = [ItemsTableViewDataSource new];
	self.tableView.dataSource = self.tableViewDataSource;
}

#pragma mark - UI

- (void)addTableView
{
	self.tableView = [UITableView new];
	self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
	[self.view addSubview:self.tableView];
}

- (void)addLoadingView
{
	self.loadingView = [LoadingView loadingViewWithMessage:@"Загружаю данные..."];
	self.loadingView.hidden = YES;
	[self.view addSubview:self.loadingView];
	[self.view bringSubviewToFront:self.loadingView];
}

- (void)addSearchBar
{
	self.searchBar = [[ItemsSearchBar alloc] initWithDelegate:self.searchManager];
	[self.view addSubview:self.searchBar];
}

#pragma mark - LoadingManagerDelegate

-(void)itemsLoaded:(NSArray *)items
{
	self.loadingView.hidden = YES;
	self.tableViewDataSource.items = items;
	[self.tableView reloadData];
}

-(void)loadingFinishedWithError:(NSString *)error
{
	self.loadingView.hidden = YES;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
	[self.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(@(LoadingViewWidth));
		make.height.equalTo(@(LoadingViewHeight));
		make.center.equalTo(self.view);
	}];

	[self.searchBar mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.and.left.equalTo(self.view);
		make.top.equalTo(self.view.mas_top).with.offset(self.topLayoutGuide.length);
		make.height.equalTo(@SearchBarHeight);
	}];

	[self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.and.left.equalTo(self.view);
		make.top.equalTo(self.searchBar.mas_bottom);
		make.bottom.equalTo(self.view);
	}];
	[super updateViewConstraints];
}

@end
