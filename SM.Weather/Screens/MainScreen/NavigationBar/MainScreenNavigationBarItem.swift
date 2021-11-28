import UIKit


class MainScreenNavigationBarItem: UIBarButtonItem {
	
	public func setupItemStyle(icon: UIImage, target: AnyObject?, action: Selector?) {
		
		image = icon
		style = .plain
		tintColor = .gray
		self.target = target
		self.action = action
	
	}
	
}
