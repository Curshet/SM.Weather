import UIKit


class ScreenThreeTable: UITableView {
    
    private let dataSourceAndDelegate = ScreenThreeTableDataSource()
    
    func createTable() {
        
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        dataSource = self.dataSourceAndDelegate
        delegate = self.dataSourceAndDelegate
		register(UITableViewCell.self, forCellReuseIdentifier: ScreenThreeTableDataSource.tableCellIdentifier)
        
    }
    
}
