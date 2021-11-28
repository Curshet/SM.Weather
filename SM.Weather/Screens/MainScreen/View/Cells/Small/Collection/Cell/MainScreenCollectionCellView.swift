import UIKit


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
		
		upLabel.disableAutoResizingMask()
		middleImageView.disableAutoResizingMask()
		downLabel.disableAutoResizingMask()
	}
	
	private func setupSubViewsInCell(cell: MainScreenCollectionCell) {
		cell.addSubview(upLabel)
		cell.addSubview(middleImageView)
		cell.addSubview(downLabel)
	}
	
	private func setupConstraintsForSubviews(cell: MainScreenCollectionCell) {
		NSLayoutConstraint.activate([
			upLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10),
			upLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10),
			upLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
			
			middleImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 35),
			middleImageView.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.4),
			middleImageView.heightAnchor.constraint(equalTo: cell.heightAnchor,multiplier: 0.3),
			middleImageView.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
			
			downLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
			downLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10),
			downLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -10)
		])
	}
	
	public func setupContentToFieldsOfCell(_ content: CollectionCellData) {
		upLabel.text = content.time
		middleImageView.image = UIImage(named: content.weatherStatus)
		downLabel.text = content.temparature
	}
	
}
