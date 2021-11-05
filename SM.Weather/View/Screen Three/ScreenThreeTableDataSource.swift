import UIKit


class ScreenThreeTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    static let tableCellIdentifier = "ScreenThreeTableCell"
    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
	//Heigth of cell
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
     }
    
    //Creating cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreenThreeTableDataSource.tableCellIdentifier, for: indexPath)
        
        let backGroundView = UIView()
			backGroundView.frame = CGRect(x: cell.bounds.minX, y: cell.bounds.minY, width: cell.bounds.width - 40, height: cell.bounds.height - 10)
			backGroundView.center.x = cell.center.x
			backGroundView.layer.cornerRadius = 16
			backGroundView.backgroundColor = UIColor(named: "TableCellColor")
        
        cell.addSubview(backGroundView)
        
        return cell
        
    }

}
