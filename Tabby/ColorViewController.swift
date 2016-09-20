//
//  ColorViewController.swift
//  Tabby
//
//  Created by Andrew Pontious on 9/17/16.
//  Copyright © 2016 Andrew Pontious. All rights reserved.
//

import UIKit

class ColorViewController: UITableViewController {

	var color: UIColor

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		self.color = UIColor.black
		
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		self.color = UIColor.black

		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = self.color;
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//MARK: - UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 30
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel!.text = "\(indexPath.row)"
		cell.backgroundColor = self.color
		return cell
	}
}
