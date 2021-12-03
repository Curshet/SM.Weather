import Foundation
import Alamofire

fileprivate let currenttCity = "Moscow"
fileprivate let keyForRequest = "34911b62733b8414cf89b7a25783adf5"

class WeatherApiProvider: WeatherApiProviderProtocol {
	
	public func requestWeatherDouble(success: @escaping (DataCell) -> Void, fail: @escaping () -> Void) {
		
		let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(currenttCity)&units=metric&lang=ru&appid=\(keyForRequest)"
		
		let url = URL(string: urlString)
		let session = URLSession(configuration: .default)
		session.dataTask(with: url!) { (data, response, error) in
			
			guard error == nil else {
				print("We have an error: \(error!)!")
				fail()
				return
			}
			
			guard data != nil else {
				print("We have no data!")
				fail()
				return
			}
			
			do {
				let data = try JSONDecoder().decode(DataCell.self, from: data!)
				success(data)
				print("Data was downloaded from JSON!")
			} catch {
				print("We have an error \(error) of parcing data!")
				fail()
			}
			
		} .resume()
        
	}
	
}
