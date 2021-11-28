import UIKit


class MainScreenTableBigCell: UITableViewCell {

	static let bigCellIdentifier = "BigTableCell"

	public func setupDataToCell(cellModel: TableBigCellData) {
        MainScreenTableBigCellView(self).setupContentToFieldsOfCell(cellModel)
	}
	
}
