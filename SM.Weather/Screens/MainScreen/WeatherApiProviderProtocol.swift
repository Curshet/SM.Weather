import Foundation

protocol WeatherApiProviderProtocol {
	func requestWeatherInfo(success: @escaping (DataCell) -> Void, fail: @escaping () -> Void)
}
