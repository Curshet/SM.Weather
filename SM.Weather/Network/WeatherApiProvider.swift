import Foundation
import Alamofire

fileprivate let currenttCity = "Moscow"
fileprivate let keyForRequest = "34911b62733b8414cf89b7a25783adf5"

class WeatherApiProvider: WeatherApiProviderProtocol {
	
	public func requestWeatherInfo(success: @escaping (DataCell) -> Void, fail: @escaping () -> Void) {
		
		let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(currenttCity)&units=metric&lang=ru&appid=\(keyForRequest)"
        
        AF.request(urlString).responseJSON {
            
            guard $0.error == nil else {
                print("Error data downloading: \($0.error!)!")
                fail()
                return
            }
            
            guard $0.data != nil else {
                print("No downloaded data!")
                fail()
                return
            }
            
            do {
                let data = try JSONDecoder().decode(DataCell.self, from: $0.data!)
                success(data)
                print("Data was downloaded from network!")
            } catch {
                print("Error of data parcing!")
                fail()
            }

        }
        
	}
	
}
