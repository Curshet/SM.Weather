import UIKit


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
		
		backImageView.disableAutoResizingMask()
		labelUp.disableAutoResizingMask()
		labelDownOne.disableAutoResizingMask()
		labelDownTwo.disableAutoResizingMask()
		middleImageView.disableAutoResizingMask()
	}
	
	private func setupSubViewsInCell(cell: MainScreenTableBigCell) {
		cell.addSubview(backImageView)
		cell.addSubview(labelUp)
		cell.addSubview(middleImageView)
		cell.addSubview(labelDownOne)
		cell.addSubview(labelDownTwo)
	}
	
	private func setupConstraintsForSubviews(cell: MainScreenTableBigCell) {
		NSLayoutConstraint.activate([
			backImageView.topAnchor.constraint(equalTo: cell.topAnchor),
			backImageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -10),
			backImageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: -10),
			backImageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
			
			labelUp.topAnchor.constraint(equalTo: cell.topAnchor, constant: 18),
			labelUp.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -240),
			labelUp.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 70),
			labelUp.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -70),
			
			middleImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 75),
			middleImageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor,constant: -120),
			middleImageView.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.30),
			middleImageView.heightAnchor.constraint(equalTo: cell.heightAnchor,multiplier: 0.35),
			middleImageView.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
			
			labelDownOne.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 32),
			labelDownOne.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -32),
			labelDownOne.topAnchor.constraint(equalTo: cell.topAnchor, constant: 190),
			
			labelDownTwo.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 32),
			labelDownTwo.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -32),
			labelDownTwo.topAnchor.constraint(equalTo: cell.topAnchor, constant: 250)
		])
	}
	
	public func setupContentToFieldsOfCell(_ content: TableBigCellData) {
		backImageView.image = UIImage(named: "ScreenBackgroundImage")
		labelUp.text = content.currentDate
		middleImageView.image = UIImage(named: content.middleImageWeather)
		labelDownOne.text = content.labelDownOneWithCurrentTemp
		labelDownTwo.text = content.labelDownTwoWithWeatherDescription
	}
	
}
