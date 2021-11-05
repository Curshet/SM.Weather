import UIKit


class ScreenOneTable: UITableView {
	
	private let dataSourceAndDelegate = ScreenOneTableDataSource()
	
	func createTable() {
		
		separatorStyle = .none
		showsVerticalScrollIndicator = false
		delegate = dataSourceAndDelegate
		dataSource = dataSourceAndDelegate
		register(UITableViewCell.self, forCellReuseIdentifier: ScreenOneTableDataSource.tableCellIdentifier)
		
	}
	
}
