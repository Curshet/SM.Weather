import UIKit


class MainScreenCollectionCell: UICollectionViewCell {
	
	static let cellIdentifier = "CollectionCell"

	public func setupDataForCell(cellModel: CollectionCellData) {
        MainScreenCollectionCellView(self).setupContentToFieldsOfCell(cellModel)
	}
	
}
