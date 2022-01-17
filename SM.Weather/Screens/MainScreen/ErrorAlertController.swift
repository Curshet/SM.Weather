import UIKit

class ErrorAlertController {
	
    public func returnErrorMessage() -> UIAlertController {
		let alertController = UIAlertController(title: "Server error!",
												message: "Нажмите \"ОК\" для завершения",
												preferredStyle: .alert)
		
        let actionOfAlertController = UIAlertAction(title: "ОК", style: .default)
		alertController.addAction(actionOfAlertController)
		
		return alertController
	}
	
}
