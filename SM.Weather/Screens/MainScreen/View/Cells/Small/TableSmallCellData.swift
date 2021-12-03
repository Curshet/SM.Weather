import Foundation

struct TableSmallCellData: TableCellProtocol {
	let leftLabelWithDateText: String
	let rightLabelOneWithCurrentTempText: String
	let rightLabelTwoWithFeelsTempText: String
	let rightImageOfWeatherStatus: String
	let collectionViewContent: [CollectionCellData]
}
