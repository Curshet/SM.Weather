import UIKit


class MainScreenCollectionView: UICollectionView {
	
	private let customDataSource = MainScreenCollectionViewDataSource()

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public init() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		super.init(frame: .zero, collectionViewLayout: layout)
		collectionViewStyle()
		delegate = customDataSource
		dataSource = customDataSource
		register(MainScreenCollectionCell.self, forCellWithReuseIdentifier: MainScreenCollectionCell.cellIdentifier)
	}
	
	private func collectionViewStyle() {
		layer.cornerRadius = 10
		backgroundColor = .clear
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
	}

	public func setDataToCells(cellContent: [CollectionCellData]) {
        customDataSource.setContentToCell(collectionContent: cellContent)
	}
	
}
