import UIKit


class ScreenOneTableController: UITableViewController {
	
	private let tableViewForScreenOne = ScreenOneTable()
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		tableViewForScreenOne.createTable()
		view = tableViewForScreenOne
		
	}
	
}
