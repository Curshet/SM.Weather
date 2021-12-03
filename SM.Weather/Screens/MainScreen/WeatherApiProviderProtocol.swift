import Foundation

protocol WeatherApiProviderProtocol {
	func requestWeatherDouble(success: @escaping (DataCell) -> Void, fail: @escaping () -> Void)
}
