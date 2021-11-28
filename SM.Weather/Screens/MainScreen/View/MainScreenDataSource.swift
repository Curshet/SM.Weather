import UIKit


fileprivate let heightOfBigTableCell = CGFloat(290)
fileprivate let heightOfSmallTableCell = CGFloat(175)

class MainScreenDataSource: NSObject, UITableViewDataSource {
	
	private var items = [TableCellProtocol]()
	
	public func setContentToCell(tableContent: [TableCellProtocol]) {
		items = tableContent
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return heightOfBigTableCell
		} else {
			return heightOfSmallTableCell
		}
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableBigCell.bigCellIdentifier, for: indexPath) as! MainScreenTableBigCell
			cell.setupDataToCell(cellModel: items[indexPath.row] as! TableBigCellData)
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableSmallCell.smallCellIdentifier, for: indexPath) as! MainScreenTableSmallCell
			cell.setupDataForCell(tableCellModel: items[indexPath.row] as! TableSmallCellData)
			return cell	
		}
	}
	
}
