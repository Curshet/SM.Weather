import UIKit


//JSON data storage
public var jsonData: Information?

//List of cities
public let listOfCities = ["Moscow", "Petersburg", "Bugulma"]

//Temperature symbol
public let temperatureSymbol = "º"

//MARK: Navigation Bar
public let titleForNavigationBar: String = {
    
    if jsonData!.city.name == "Петербург" {
        return "Санкт-Петербург"
    } else {
        return jsonData!.city.name
    }
	
}()

//MARK: ScreenOneTable
//Big table cell
public let labelUpForBigTableCell: String = {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "Сегодня, dd MMMM, EE"
    return dateFormatter.string(from: date)
    
}()

public let labelDownOneForBigTableCell = "\(Int(jsonData!.list[0].main.temp))" + temperatureSymbol
public let statusOfWeatherBigCell = jsonData!.list[0].weather[0].weatherDescription

public let returnActualWeatherImage = { (weatherStatus: String, isCellBig: Bool) -> UIImage in
    
    if isCellBig {
        
        switch weatherStatus {
            
        case "ясно", "сухо", "сухая погода", "без осадков", "малооблачно", "малооблачная погода", "ясная погода", "солнечная погода", "солнечно":
            return UIImage(named: "SunBig")!
			
        case "пасмурно", "облачно с прояснениями", "пасмурные облака", "облачно", "переменная облачность", "ветренно", "ветер с порывами", "ветер", "слабый ветер", "сильный ветер", "умеренный ветер", "очень сильный ветер", "прохладно", "холодно", "небольшая облачность", "дождь", "небольшой дождь", "слабый дождь", "сильный дождь", "мелкий дождь", "кратковременный дождь", "дождь со снегом", "снег с дождем", "временами снег", "мокрый снег", "морось", "заморозки", "небольшой снег", "слабый снег", "снегопад", "сильный снегопад":
            return UIImage(named: "CloudBig")!
            
        case "гроза", "ливень", "гром с грозой", "гром", "ливень с грозой", "ливневый дождь", "ураган", "ураганный ветер":
            return UIImage(named: "ThunderBig")!
            
        default:
            return UIImage()
            
        }
        
    } else {
        
        switch weatherStatus {
            
        case "ясно", "сухо", "сухая погода", "без осадков", "малооблачно", "малооблачная погода", "ясная погода", "солнечная погода", "солнечно":
            return UIImage(named: "SunSmall")!
            
        case "пасмурно", "облачно с прояснениями", "пасмурные облака", "облачно", "переменная облачность", "ветренно", "ветер с порывами", "ветер", "слабый ветер", "сильный ветер", "умеренный ветер", "очень сильный ветер", "прохладно", "холодно", "небольшая облачность":
            return UIImage(named: "CloudSmall")!
            
        case "дождь", "небольшой дождь", "слабый дождь", "сильный дождь", "мелкий дождь", "кратковременный дождь", "дождь со снегом", "снег с дождем", "временами снег", "мокрый снег", "морось", "заморозки", "небольшой снег", "слабый снег", "снегопад", "сильный снегопад":
            return UIImage(named: "RainSmall")!
            
        case "гроза", "ливень", "гром с грозой", "гром", "ливень с грозой", "ливневый дождь", "ураган", "ураганный ветер":
            return UIImage(named: "ThunderSmall")!
            
        default:
            return UIImage()
            
        }
        
    }
    
}

fileprivate let arrayOfWordsInWeatherStatus = jsonData!.list[0].weather[0].weatherDescription.components(separatedBy: " ")

public let labelDownTwoForBigTableCell: String = {
    
    switch arrayOfWordsInWeatherStatus.count {
        
    case 1:
        return "\(arrayOfWordsInWeatherStatus[0].capitalized), " +
            "ощущается как " +
        "\(Int(jsonData!.list[0].main.feelsLike))" +
		temperatureSymbol
        
    case 2:
        return "\(arrayOfWordsInWeatherStatus[0].capitalized) " +
            "\(arrayOfWordsInWeatherStatus[1]), " +
            "ощущается как " +
        "\(Int(jsonData!.list[0].main.feelsLike))" +
		temperatureSymbol
        
    case 3:
        return "\(arrayOfWordsInWeatherStatus[0].capitalized) " +
            "\(arrayOfWordsInWeatherStatus[1]) " +
            "\(arrayOfWordsInWeatherStatus[2]), " +
            "ощущается как " +
        "\(Int(jsonData!.list[0].main.feelsLike))" +
		temperatureSymbol
        
    default:
        return ""
        
    }
    
}()


//Small table cell (1st)
public let leftLabelForSmallCellOne: String = {
    
    let date = Date(timeIntervalSince1970: TimeInterval(jsonData!.list[8].dt))
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "dd MMMM, EE"
    return dateFormatter.string(from: date)
    
}()

public let rightLabelOneSmallCellOne = "\(Int(jsonData!.list[8].main.temp))" + temperatureSymbol
public let rightLabelTwoSmallCellOne = "\(Int(jsonData!.list[8].main.feelsLike))" + temperatureSymbol
public let statusOfWeatherSmallCellOne = jsonData!.list[8].weather[0].weatherDescription

//Small table cell (2nd)
public let leftLabelForSmallCellTwo: String = {
    
    let date = Date(timeIntervalSince1970: TimeInterval(jsonData!.list[16].dt))
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "dd MMMM, EE"
    return dateFormatter.string(from: date)
    
}()

public let rightLabelOneSmallCellTwo = "\(Int(jsonData!.list[16].main.temp))" + temperatureSymbol
public let rightLabelTwoSmallCellTwo = "\(Int(jsonData!.list[16].main.feelsLike))" + temperatureSymbol
public let statusOfWeatherSmallCellTwo = jsonData!.list[16].weather[0].weatherDescription

//Small table cell (3rd)
public let leftLabelForSmallCellThree: String = {
    
    let date = Date(timeIntervalSince1970: TimeInterval(jsonData!.list[24].dt))
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "dd MMMM, EE"
    return dateFormatter.string(from: date)
    
}()

public let rightLabelOneSmallCellThree = "\(Int(jsonData!.list[24].main.temp))" + temperatureSymbol
public let rightLabelTwoSmallCellThree = "\(Int(jsonData!.list[24].main.feelsLike))" + temperatureSymbol
public let statusOfWeatherSmallCellThree = jsonData!.list[24].weather[0].weatherDescription

//Small table cell (4th)
public let leftLabelForSmallCellFour: String = {
    
    let date = Date(timeIntervalSince1970: TimeInterval(jsonData!.list[32].dt))
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "dd MMMM, EE"
    return dateFormatter.string(from: date)
    
}()

public let rightLabelOneSmallCellFour = "\(Int(jsonData!.list[32].main.temp))" + temperatureSymbol
public let rightLabelTwoSmallCellFour = "\(Int(jsonData!.list[32].main.feelsLike))" + temperatureSymbol
public let statusOfWeatherSmallCellFour = jsonData!.list[32].weather[0].weatherDescription

//MARK: ScreenOneTableCollection
//1st
public var statusOfWeatherCollectionCellOne = jsonData!.list[0].weather[0].weatherDescription
public var imageInMiddleCollectionCellOne = returnActualWeatherImage(statusOfWeatherCollectionCellOne, false)
public var labelDownForCollectionCellOne = String(Int(jsonData!.list[4].main.temp)) + temperatureSymbol

//2nd
public var statusOfWeatherCollectionCellTwo = jsonData!.list[7].weather[0].weatherDescription
public var imageInMiddleCollectionCellTwo = returnActualWeatherImage(statusOfWeatherCollectionCellTwo, false)
public var labelDownForCollectionCellTwo = String(Int(jsonData!.list[5].main.temp)) + temperatureSymbol

//3rd
public var statusOfWeatherCollectionCellThree = jsonData!.list[15].weather[0].weatherDescription
public var imageInMiddleCollectionCellThree = returnActualWeatherImage(statusOfWeatherCollectionCellThree, false)
public var labelDownForCollectionCellThree = String(Int(jsonData!.list[6].main.temp)) + temperatureSymbol

//4th
public var statusOfWeatherCollectionCellFour = jsonData!.list[23].weather[0].weatherDescription
public var imageInMiddleCollectionCellFour = returnActualWeatherImage(statusOfWeatherCollectionCellFour, false)
public var labelDownForCollectionCellFour = String(Int(jsonData!.list[7].main.temp)) + temperatureSymbol

//5th
public var statusOfWeatherCollectionCellFive = jsonData!.list[31].weather[0].weatherDescription
public var imageInMiddleCollectionCellFive = returnActualWeatherImage(statusOfWeatherCollectionCellFive, false)
public var labelDownForCollectionCellFive = String(Int(jsonData!.list[8].main.temp)) + temperatureSymbol
