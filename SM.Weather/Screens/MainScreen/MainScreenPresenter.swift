import Foundation


public let temperatureSymbol = "º"
public let feelsLikeSymbol = "ощущается как "

class MainScreenPresenter: MainScreenPresenterProtocol {
	
	weak var view: MainScreenRootViewProtocol?
	private var requestDataFromNetwork: WeatherApiProviderProtocol?
	
	public func loadData() {
		
		let request = WeatherApiProvider()
		requestDataFromNetwork = request
		requestDataFromNetwork?.requestWeatherDouble(success: { [weak self] (data) in
			self?.setDataFromJson(data)
		},
		fail: { [weak self] in
			self?.sendError()
		})
		
	}
	
	private func sendError() {
		DispatchQueue.main.async {
			self.view?.errorCase()
		}
	}
	
	private func setDataFromJson(_ data: DataCell) {
		sendContentToCellsStructures(data)
	}
	
	private func sendContentToCellsStructures(_ dataFromJSON: DataCell) {
		let titleOfNavigationBar = dataFromJSON.city.name
		
		let arrayOfContent: [TableCellProtocol] = [
			convertDataFromJsonToTableBigCellStruct(dataFromJSON.list),
			convertDataFromJsonToTableSmallCellStruct(dataFromJSON, 8),
			convertDataFromJsonToTableSmallCellStruct(dataFromJSON, 16),
			convertDataFromJsonToTableSmallCellStruct(dataFromJSON, 24),
			convertDataFromJsonToTableSmallCellStruct(dataFromJSON, 32)
		]
		DispatchQueue.main.async {
			self.view?.setContentToCells(cellContent: arrayOfContent, titleText: titleOfNavigationBar)
		}
	}
	
	private func convertDataFromJsonToTableBigCellStruct(_ list: [List]) -> TableBigCellData {
		return TableBigCellData(
				currentDate: dateFormatter(0, true),
				middleImageWeather: convertIndexOfWeaherStatusToImage(list[returnIndexOfDayTime(0, 0, true)].weather[0].id, true),
				labelDownOneWithCurrentTemp: String(Int((list[returnIndexOfDayTime(0, 0, true)].main.temp))) +
					temperatureSymbol,
				labelDownTwoWithWeatherDescription: "\(separatingWeatherDescriptionStringInBigTable(list[returnIndexOfDayTime(0, 0, true)].weather[0].weatherDescription)), " +
					feelsLikeSymbol +
					"\(Int((list[returnIndexOfDayTime(0, 0, true)].main.feelsLike)))" + temperatureSymbol)
	}
	
	private func dateFormatter(_ time: Double, _ isCellBig: Bool) -> String {
		let date: Date = {
			if isCellBig {
				return Date()
			} else {
				return Date(timeIntervalSince1970: time)
			}
		}()
		
			let dateFormatter = DateFormatter()
			dateFormatter.locale = Locale(identifier: "ru_RU")
			dateFormatter.dateFormat = {
			if isCellBig {
				return "Сегодня, dd MMMM, E"
			} else {
				return "dd MMMM, E"
			}
		}()
		
			return dateFormatter.string(from: date)
	}
	
	private func convertIndexOfWeaherStatusToImage(_ weatherID: Int, _ isCellBig: Bool) -> String {
		if isCellBig {
			switch weatherID {
				case 0...299:
					return "SunBig"
				case 300...699:
					return "ThunderBig"
				case 700...799:
					return "RainBig"
				case 800...899:
					return "CloudBig"
				default:
					return ""
			}
		} else {
			switch weatherID {
				case 0...299:
					return "SunSmall"
				case 300...699:
					return "ThunderSmall"
				case 700...799:
					return "RainSmall"
				case 800...899:
					return "CloudSmall"
				default:
					return ""
			}
		}
	}
	
	private func returnIndexOfDayTime(_ firstIndexOfDayStart: Int, _ numberOfCell: Int, _ isCellBig: Bool) -> Int {
		if isCellBig {
			let hour = Calendar.current.component(.hour, from: Date())
			
			switch hour {
				case 0...3:
					return 0
				case 4...6:
					return 1
				case 7...9:
					return 2
				case 10...12:
					return 3
				case 13...14:
					return 4
				case 15...18:
					return 5
				case 19...21:
					return 6
				case 22...23:
					return 7
				default:
					return 0
			}
		} else {
			switch numberOfCell {
				case 1:
					return firstIndexOfDayStart
				case 2:
					return firstIndexOfDayStart + 1
				case 3:
					return firstIndexOfDayStart + 2
				case 4:
					return firstIndexOfDayStart + 3
				case 5:
					return firstIndexOfDayStart + 4
				case 6:
					return firstIndexOfDayStart + 5
				case 7:
					return firstIndexOfDayStart + 6
				case 8:
					return firstIndexOfDayStart + 7
				default:
					return 0
			}
		}
	}
	
	private func separatingWeatherDescriptionStringInBigTable(_ description: String) -> String {
		let arrayOfCharsInDescription = description.components(separatedBy: " ")
		
		switch arrayOfCharsInDescription.count {
			case 1:
				return "\(arrayOfCharsInDescription[0].capitalized)"
			case 2:
				return "\(arrayOfCharsInDescription[0].capitalized) " +
						"\(arrayOfCharsInDescription[1])"
			case 3:
				return "\(arrayOfCharsInDescription[0].capitalized) " +
						"\(arrayOfCharsInDescription[1]) " +
						"\(arrayOfCharsInDescription[2])"
			default:
				return ""
		}
	}

	private func convertDataFromJsonToTableSmallCellStruct(_ dataFromJSON: DataCell, _ index: Int) -> TableSmallCellData {
		let list = dataFromJSON.list[index]
		let listOfCells = returnArrayWithCollectionCells(dataFromJSON, index)
		
		return TableSmallCellData(leftLabelWithDateText: dateFormatter(Double(list.dt), false),
									rightLabelOneWithCurrentTempText: String(Int(list.main.temp)) + temperatureSymbol,
									rightLabelTwoWithFeelsTempText: String(Int(list.main.feelsLike)) + temperatureSymbol,
									rightImageOfWeatherStatus: convertIndexOfWeaherStatusToImage(list.weather[0].id, false),
									collectionViewContent: listOfCells)
	}
	
	private func returnArrayWithCollectionCells(_ dataFromJSON: DataCell, _ index: Int) -> [CollectionCellData] {
		return [
			returnCollectionCellStruct(dataFromJSON, 1, index),
			returnCollectionCellStruct(dataFromJSON, 2, index),
			returnCollectionCellStruct(dataFromJSON, 3, index),
			returnCollectionCellStruct(dataFromJSON, 4, index),
			returnCollectionCellStruct(dataFromJSON, 5, index),
			returnCollectionCellStruct(dataFromJSON, 6, index),
			returnCollectionCellStruct(dataFromJSON, 7, index),
			returnCollectionCellStruct(dataFromJSON, 8, index)
		]
	}
	
	private func returnCollectionCellStruct(_ dataFromJSON: DataCell, _ numberOfCell: Int, _ index: Int) -> CollectionCellData {
		let arrayOfPrameters = dataFromJSON.list
		
		return CollectionCellData(time: returnTimeValueInCollectionCell(numberOfCell),
									weatherStatus: convertIndexOfWeaherStatusToImage(Int(arrayOfPrameters[returnIndexOfDayTime(index, numberOfCell, false)].weather[0].id), false),
									temparature: "\(Int(arrayOfPrameters[returnIndexOfDayTime(index, numberOfCell, false)].main.temp))" + temperatureSymbol)
	}
	
	private func returnTimeValueInCollectionCell(_ inputNumberCell: Int) -> String {
		switch inputNumberCell {
			case 1:
				return "00:00"
			case 2:
				return "03:00"
			case 3:
				return "06:00"
			case 4:
				return "09:00"
			case 5:
				return "12:00"
			case 6:
				return "15:00"
			case 7:
				return "18:00"
			case 8:
				return "21:00"
			default:
				return ""
		}
	}
	
}

