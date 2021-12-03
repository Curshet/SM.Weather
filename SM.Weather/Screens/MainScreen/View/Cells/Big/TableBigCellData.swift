import Foundation

protocol TableCellProtocol {}

struct TableBigCellData: TableCellProtocol {
	let currentDate: String
	let middleImageWeather: String
	let labelDownOneWithCurrentTemp: String
	let labelDownTwoWithWeatherDescription: String
}
