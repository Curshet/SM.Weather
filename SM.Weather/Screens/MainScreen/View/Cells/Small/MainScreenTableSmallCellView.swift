import UIKit


class MainScreenTableSmallCellView {
	
	private var backView = UIView()
	private var leftLabel = UILabel()
	private var rightLabelWithMainTemp = UILabel()
	private var rightLabelWithTemFeelsLike = UILabel()
	private var rightImageView = UIImageView()
	private var separatorView = UIView()
	private var collectionView = MainScreenCollectionView()

	public init(_ cell: MainScreenTableSmallCell) {
		setCellStyle(cell: cell)
	}
	
	private func setCellStyle(cell: MainScreenTableSmallCell) {
		cell.selectionStyle = .none
		styleForSubViews()
		setupSubViewsInCell(cell: cell)
		setupConstraintsForSubviews(cell: cell)
	}
	
	private func styleForSubViews() {
		backView.backgroundColor = UIColor(named: "TableCellColor")
		backView.layer.cornerRadius = 25
		
		leftLabel.textColor = {
			UIViewController.isDarkMode ? UIColor(named: "white") : UIColor(named: "black")
		}()
		leftLabel.textAlignment = .left
		leftLabel.font = .systemFont(ofSize: 16)
		
		rightLabelWithMainTemp.textColor = {
			UIViewController.isDarkMode ? UIColor(named: "white") : UIColor(named: "black")
		}()
		rightLabelWithMainTemp.textAlignment = .center
		rightLabelWithMainTemp.font = UIFont.boldSystemFont(ofSize: 16)
		
		rightLabelWithTemFeelsLike.textColor = .lightGray
		rightLabelWithTemFeelsLike.textAlignment = .center
		rightLabelWithTemFeelsLike.font = UIFont.boldSystemFont(ofSize: 16)
		rightImageView.contentMode = .scaleAspectFit
	
		separatorView.backgroundColor =  .lightGray

		backView.disableAutoResizingMask()
		leftLabel.disableAutoResizingMask()
		rightLabelWithMainTemp.disableAutoResizingMask()
		rightLabelWithTemFeelsLike.disableAutoResizingMask()
		rightImageView.disableAutoResizingMask()
		separatorView.disableAutoResizingMask()
		collectionView.disableAutoResizingMask()
	}
	
	private func setupSubViewsInCell(cell: MainScreenTableSmallCell) {
		cell.addSubview(backView)
		cell.addSubview(leftLabel)
		cell.addSubview(rightLabelWithMainTemp)
		cell.addSubview(rightLabelWithTemFeelsLike)
		cell.addSubview(rightImageView)
		cell.addSubview(separatorView)
		cell.addSubview(collectionView)
	}
	
	private func setupConstraintsForSubviews(cell: MainScreenTableSmallCell) {
		NSLayoutConstraint.activate([
			backView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 5),
			backView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -5),
			backView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
			backView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10),
			
			leftLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
			leftLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -137),
			leftLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
			
			rightLabelWithMainTemp.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
			rightLabelWithMainTemp.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -137),
			rightLabelWithMainTemp.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -95),
			
			rightLabelWithTemFeelsLike.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
			rightLabelWithTemFeelsLike.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -137),
			rightLabelWithTemFeelsLike.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -60),
			
			rightImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
			rightImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -137),
			rightImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
			
			separatorView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 47),
			separatorView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -131),
			separatorView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
			separatorView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),

			collectionView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 57),
			collectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
			collectionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
		])
	}
	
	public func setupContentToFieldsOfCell(_ content: TableSmallCellData) {
		leftLabel.text = content.leftLabelWithDateText
		rightImageView.image = UIImage(named: content.rightImageOfWeatherStatus)
		rightLabelWithMainTemp.text = content.rightLabelOneWithCurrentTempText
		rightLabelWithTemFeelsLike.text = content.rightLabelTwoWithFeelsTempText
		collectionView.setDataToCells(cellContent: content.collectionViewContent)
	}
	
}
