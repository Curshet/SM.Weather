import UIKit

fileprivate let widthOfCollectionCell = 65
fileprivate let heightOfCollectionCell = 100
fileprivate let minimumLineSpacingForSectionAt = CGFloat(9)

class MainScreenCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var items = [CollectionCellData]()
    
    public func setContentToCell(collectionContent: [CollectionCellData]) {
        items = collectionContent
    }

	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return minimumLineSpacingForSectionAt
	}
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: widthOfCollectionCell, height: heightOfCollectionCell)
	}
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainScreenCollectionCell.cellIdentifier, for: indexPath) as! MainScreenCollectionCell
        cell.setupDataForCell(cellModel: items[indexPath.row])
        return cell
    }
    
}
