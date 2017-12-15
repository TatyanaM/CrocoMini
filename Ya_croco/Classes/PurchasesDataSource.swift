//
//  PurchasesDataSource.swift
//  Ya_croco
//
//  Created by Tatiana Mudryak on 15/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

import UIKit

class PurchasesDataSource : NSObject, UITableViewDelegate {

	var items = [Item]()

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:"ItemCell", for: indexPath)



		return cell
	}

}
