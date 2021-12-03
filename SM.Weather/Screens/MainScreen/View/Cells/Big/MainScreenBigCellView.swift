import UIKit
import SnapKit

class MainScreenTableBigCellView {
	
	private var backImageView = UIImageView()
	private var labelUp = UILabel()
	private var middleImageView = UIImageView()
	private var labelDownOne = UILabel()
	private var labelDownTwo = UILabel()
	
	public init(_ cell: MainScreenTableBigCell) {
		cellStyle(cell: cell)
	}
	
	private func cellStyle(cell: MainScreenTableBigCell) {
		cell.selectionStyle = .none
		cell.layer.cornerRadius = 30
		styleForSubViews()
		setupSubViewsInCell(cell: cell)
		setupConstraintsForSubviews(cell: cell)
	}
	
	private func styleForSubViews() {
		labelUp.textColor = .white
		labelUp.textAlignment = .center
		labelUp.font = .systemFont(ofSize: 16)
		
		middleImageView.contentMode = .scaleAspectFit
		
		labelDownOne.textColor = .white
		labelDownOne.textAlignment = .center
		labelDownOne.font = UIFont.boldSystemFont(ofSize: 42)
		
		labelDownTwo.textColor = .white
		labelDownTwo.textAlignment = .center
		labelDownTwo.font = .systemFont(ofSize: 16)
	}
	
	private func setupSubViewsInCell(cell: MainScreenTableBigCell) {
		cell.addSubview(backImageView)
		cell.addSubview(labelUp)
		cell.addSubview(middleImageView)
		cell.addSubview(labelDownOne)
		cell.addSubview(labelDownTwo)
	}
	
	private func setupConstraintsForSubviews(cell: MainScreenTableBigCell) {
        backImageView.snp.makeConstraints {
            $0.top.equalTo(cell)
            $0.bottom.leading.trailing.equalTo(cell).inset(18)
        }
        
        labelUp.snp.makeConstraints {
            $0.top.equalTo(cell).inset(18)
            $0.bottom.equalTo(cell).inset(240)
            $0.leading.trailing.equalTo(cell).inset(70)
        }
        
        middleImageView.snp.makeConstraints {
            $0.centerX.equalTo(cell)
            $0.top.equalTo(cell).inset(75)
            $0.bottom.equalTo(cell).inset(120)
            $0.width.equalTo(cell).multipliedBy(0.3)
            $0.height.equalTo(cell).multipliedBy(0.35)
        }
        
        labelDownOne.snp.makeConstraints {
            $0.top.equalTo(cell).inset(190)
            $0.leading.trailing.equalTo(cell).inset(32)
        }
        
        labelDownTwo.snp.makeConstraints {
            $0.top.equalTo(cell).inset(250)
            $0.leading.trailing.equalTo(cell).inset(32)
        }
	}
	
	public func setupContentToFieldsOfCell(_ content: TableBigCellData) {
		backImageView.image = UIImage(named: "ScreenBackgroundImage")
		labelUp.text = content.currentDate
		middleImageView.image = UIImage(named: content.middleImageWeather)
		labelDownOne.text = content.labelDownOneWithCurrentTemp
		labelDownTwo.text = content.labelDownTwoWithWeatherDescription
	}
	
}
