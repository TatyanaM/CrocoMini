//
//  SearchViewController.m
//  CrocoMini
//
//  Created by Tatiana Mudryak on 30/11/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "SearchViewController.h"
#import "LoadingManager.h"
#import "ItemStoreManager.h"
#import "ItemsTableViewDataSource.h"

static NSString *const SearchViewControllerTitle = @"Поиск";

@interface SearchViewController () <LoadingManagerDelegate, ItemCellDelegate, UISearchBarDelegate>

//data
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ItemsTableViewDataSource *tableViewDataSource;

//loading
@property (nonatomic, strong) LoadingView *loadingView;
@property (nonatomic, strong) LoadingManager *loadingManager;

//search
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *filteredItems;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = SearchViewControllerTitle;

	self.loadingManager = [LoadingManager new];
	self.loadingManager.delegate = self;

	// adjust UI
	[self addTableView];
	[self addLoadingView];
	[self addSearchBar];

	// load items data
	[self loadItems];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.tableView reloadData];

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


#pragma mark - UI

- (void)addTableView
{
	self.tableView = [UITableView new];
	self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
	self.tableView.estimatedRowHeight = 100;
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	[self.view addSubview:self.tableView];

	self.tableViewDataSource = [ItemsTableViewDataSource new];
	self.tableViewDataSource.delegate = self;
	self.tableViewDataSource.searchEnabled = NO;
	self.tableView.dataSource = self.tableViewDataSource;
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
	self.searchBar = [[UISearchBar alloc] init];
	self.searchBar.delegate = self;
	self.searchBar.placeholder = @"Поиск";
	self.searchBar.showsCancelButton = YES;
	[self.view addSubview:self.searchBar];
}

- (void)fetchItems
{
	[[ItemStoreManager sharedManager] getItemsWithCompletionHandler:^(NSArray *items) {
		self.tableViewDataSource.items = items;
		[self.tableView reloadData];
	}];
}


#pragma mark - ItemCellDelegate

- (void)changeStatusInCartForItem:(Item *)item
{
	[[ItemStoreManager sharedManager] changeStatusInCartForItem:item withCompletionHandler:^(BOOL finished) {
		if (finished) {
			[self.tableView reloadData];
		}
	}];
}

#pragma mark - LoadingManagerDelegate

-(void)itemsLoaded:(NSArray *)items
{
	self.loadingView.hidden = YES;
	[self fetchItems];
}

-(void)loadingFinishedWithError:(NSString *)error
{
	self.loadingView.hidden = YES;
	[self presentViewController:[AlertViewHelper alertWithTitle:@"Ошибка!" andMessage:error]
					   animated:YES
					 completion:nil];
}


#pragma mark - Search delegate methods

- (void)filterContentForSearchText:(NSString*)searchText
{
	[[ItemStoreManager sharedManager] foundItemWithText:searchText andCompletionHandler:^(NSArray *items) {
		self.tableViewDataSource.filteredItems = items;
		[self.tableView reloadData];
	}];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	if (searchBar.text.length == 0) {
		self.tableViewDataSource.searchEnabled = NO;
		[self.tableView reloadData];
	}
	else {
		self.tableViewDataSource.searchEnabled = YES;
		[self filterContentForSearchText:searchBar.text];
	}
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
	self.tableViewDataSource.searchEnabled = YES;
	[self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
	[searchBar setText:@""];
	self.tableViewDataSource.searchEnabled = NO;
	[self.tableView reloadData];

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
