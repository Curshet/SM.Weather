import UIKit


class MainScreenTableSmallCell: UITableViewCell {
	
	static let smallCellIdentifier = "SmallTableCell"
	
	public func setupDataForCell(tableCellModel: TableSmallCellData) {
        MainScreenTableSmallCellView(self).setupContentToFieldsOfCell(tableCellModel)
	}
	
}
