import Foundation


class NetworkManager {
	
	private let keyForRequest = "34911b62733b8414cf89b7a25783adf5"
    
    func startProcess() {
        
        let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(listOfCities[0])&units=metric&lang=ru&appid=\(keyForRequest)"

        guard let urlObj = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: urlObj) { (data, response, error) in
            
            guard error == nil else {
                print("We have an error!")
                return
            }
            
            guard data != nil else {
                print("We have no data!")
                return
            }
            
			//Error handler
            do {
				jsonData = try JSONDecoder().decode(Information.self, from: data!)
            } catch {
                print("Error: \(error)")
            }
            
        } .resume()
        
    } 
    
}
