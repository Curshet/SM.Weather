import UIKit
import SnapKit

class MainScreenCollectionCellView {
	
	private var upLabel = UILabel()
	private var middleImageView = UIImageView()
	private var downLabel = UILabel()
	
	public init(_ cell: MainScreenCollectionCell) {
		cellStyle(cell: cell)
	}
	
	private func cellStyle(cell: MainScreenCollectionCell) {
		cell.layer.cornerRadius = 16
		cell.backgroundColor = UIColor(named: "CollectionCellColor")
		styleForSubViews()
		setupSubViewsInCell(cell: cell)
		setupConstraintsForSubviews(cell: cell)
	}
	
	private func styleForSubViews() {
		upLabel.textColor = .lightGray
		upLabel.textAlignment = .center
		upLabel.font = .systemFont(ofSize: 14)
		
		middleImageView.contentMode = .scaleAspectFit
		downLabel.textColor = {
			UIViewController.isDarkMode ? UIColor(named: "white") : UIColor(named: "black")
		}()
		downLabel.textAlignment = .center
		downLabel.font = UIFont.boldSystemFont(ofSize: 14)
	}
	
	private func setupSubViewsInCell(cell: MainScreenCollectionCell) {
		cell.addSubview(upLabel)
		cell.addSubview(middleImageView)
		cell.addSubview(downLabel)
	}
	
	private func setupConstraintsForSubviews(cell: MainScreenCollectionCell) {
        upLabel.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(cell).inset(10)
        }
        
        middleImageView.snp.makeConstraints {
            $0.centerX.equalTo(cell)
            $0.top.equalTo(cell).inset(35)
            $0.width.equalTo(cell).multipliedBy(0.4)
            $0.height.equalTo(cell).multipliedBy(0.3)
        }
        
        downLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(cell).inset(10)
        }
	}
	
	public func setupContentToFieldsOfCell(_ content: CollectionCellData) {
		upLabel.text = content.time
		middleImageView.image = UIImage(named: content.weatherStatus)
		downLabel.text = content.temparature
	}
	
}
