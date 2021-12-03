import UIKit

extension UIViewController {
	
	static var isDarkMode = false
	
	@objc public func darkModeButtonAction() {
		UIViewController.isDarkMode = !UIViewController.isDarkMode

		if UIViewController.isDarkMode {
			overrideUserInterfaceStyle = .dark
		} else {
			overrideUserInterfaceStyle = .light
		}
	}
	
}
