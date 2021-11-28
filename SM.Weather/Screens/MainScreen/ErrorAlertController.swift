import UIKit


class ErrorAlertController {
	
	public func returnErrorMessage() -> UIAlertController {
		let alertController = UIAlertController(title: "Server error!",
												message: "Нажмите \"ОК\" для завершения",
												preferredStyle: .alert)
		
		let actionOfAlertController = UIAlertAction(title: "ОК", style: .default, handler: nil)
		alertController.addAction(actionOfAlertController)
		
		return alertController
	}
	
}
