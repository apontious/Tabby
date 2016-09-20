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
		
		// For when we're made programmatically, not from Storyboard
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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

	//MARK: - UITableViewDataSource

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let newColorViewController = ColorViewController(nibName: nil, bundle: nil)
		newColorViewController.color = self.color
		
		self.tableView.deselectRow(at: indexPath, animated: true)
		
		// Why can't I just use the ! at the end of this to make these non-optional in the middle of the line below? Why must I make them separate variables and then later unwrap them? Swift is hard! (I.e. I don't understand this yet.)
		let fuckingOptionalTitle = self.navigationItem.title?.components(separatedBy: " ")[0]
		let fuckingOptionalCount = self.navigationController?.viewControllers.count
		
		newColorViewController.title = "\(fuckingOptionalTitle!) \(fuckingOptionalCount! + 1)"
		
		self.navigationController?.pushViewController(newColorViewController, animated: true)
	}
}
