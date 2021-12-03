import UIKit
import SnapKit

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
        backView.snp.makeConstraints {
            $0.top.bottom.equalTo(cell).inset(5)
            $0.leading.trailing.equalTo(cell).inset(18)
        }
        
        leftLabel.snp.makeConstraints {
            $0.top.equalTo(backView).inset(16)
            $0.bottom.equalTo(backView).inset(137)
            $0.leading.equalTo(backView).inset(30)
        }
        
        rightLabelWithMainTemp.snp.makeConstraints {
            $0.top.equalTo(backView).inset(16)
            $0.bottom.equalTo(backView).inset(137)
            $0.trailing.equalTo(backView).inset(95)
        }
        
        rightLabelWithTemFeelsLike.snp.makeConstraints {
            $0.top.equalTo(backView).inset(16)
            $0.bottom.equalTo(backView).inset(137)
            $0.trailing.equalTo(backView).inset(60)
        }
        
        rightImageView.snp.makeConstraints {
            $0.top.equalTo(backView).inset(10)
            $0.bottom.equalTo(backView).inset(137)
            $0.trailing.equalTo(backView).inset(20)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(backView).inset(47)
            $0.bottom.equalTo(backView).inset(131)
            $0.leading.trailing.equalTo(backView).inset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(backView).inset(57)
            $0.bottom.equalTo(backView).inset(10)
            $0.leading.trailing.equalTo(backView)
        }
	}
	
	public func setupContentToFieldsOfCell(_ content: TableSmallCellData) {
		leftLabel.text = content.leftLabelWithDateText
		rightImageView.image = UIImage(named: content.rightImageOfWeatherStatus)
		rightLabelWithMainTemp.text = content.rightLabelOneWithCurrentTempText
		rightLabelWithTemFeelsLike.text = content.rightLabelTwoWithFeelsTempText
		collectionView.setDataToCells(cellContent: content.collectionViewContent)
	}
	
}
