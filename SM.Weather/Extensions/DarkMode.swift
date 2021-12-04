import UIKit

extension UIViewController {
	
	static var isDarkMode = false
	
	@objc public func darkModeButtonAction() {
		Self.isDarkMode = !Self.isDarkMode

		if Self.isDarkMode {
			overrideUserInterfaceStyle = .dark
		} else {
			overrideUserInterfaceStyle = .light
		}
	}
	
}
