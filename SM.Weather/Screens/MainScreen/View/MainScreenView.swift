import UIKit


class MainScreenView: UITableView {
	
	private let customDataSource = MainScreenDataSource()
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		tableViewStyle()
		dataSource = customDataSource
		register(MainScreenTableBigCell.self, forCellReuseIdentifier: MainScreenTableBigCell.bigCellIdentifier)
		register(MainScreenTableSmallCell.self, forCellReuseIdentifier: MainScreenTableSmallCell.smallCellIdentifier)
	}
	
	private func tableViewStyle() {
		separatorStyle = .none
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
	}
	
	public func setDataToCells(cellContent: [TableCellProtocol]) {
		customDataSource.setContentToCell(tableContent: cellContent)
		reloadData()
	}
	
}
