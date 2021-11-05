import UIKit


class ScreenOneCollection: UICollectionView {
    
    private let dataSourceAndDelegate = ScreenOneCollectionDataSource()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
    }
    
	func createCollection() {
        
        showsHorizontalScrollIndicator = false
        dataSource = dataSourceAndDelegate
        delegate = dataSourceAndDelegate
		register(UICollectionViewCell.self, forCellWithReuseIdentifier: ScreenOneCollectionDataSource.collectionCellIdentifier)
        
    }
    
}
