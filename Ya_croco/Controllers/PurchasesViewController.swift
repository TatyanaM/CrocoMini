//
//  PurchasesViewController.swift
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

import UIKit


class PurchasesViewController : UIViewController, UITableViewDelegate {

	public let PurchasesViewControllerTitle = "Список продуктов"
	private var tableView : UITableView!
	private var tableViewDataSource = ItemsTableViewDataSource()
	var items = [Item]()

    override func viewDidLoad()
	{
        super.viewDidLoad()
		title = PurchasesViewControllerTitle

		addTableView()
    }

	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)

		getItemsInCart()
		
		self.view.setNeedsUpdateConstraints()
	}

	func addTableView()
	{
		tableView = UITableView()
		tableView.dataSource = self.tableViewDataSource
		tableView.delegate = self
		self.view.addSubview(tableView)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	func getItemsInCart() {
		ItemStoreManager.shared().getItemsInCart { (items) in
			self.tableViewDataSource.items = items as! [Item];
			self.tableViewDataSource.searchEnabled = false
			self.tableView.reloadData()
		}
	}

	// MARK :- Constraint
	override func updateViewConstraints() {
		self.tableView.mas_remakeConstraints { make in
			make?.top.equalTo()(self.view)?.with().offset()(0)
			make?.left.equalTo()(self.view)?.with().offset()(0)
			make?.right.equalTo()(self.view)?.with().offset()(0)
			make?.bottom.equalTo()(self.view)?.with().offset()(0)
			return()
		}
		super.updateViewConstraints();
	}
}
