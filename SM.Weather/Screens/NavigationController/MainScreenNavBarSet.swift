import UIKit


class MainScreenNavBarSet {
	
	public func navigationBarStyle(_ viewController: MainScreenViewController) {
		viewController.navigationBar.shadowImage = UIImage()
		addItems(viewController)
	}
	
	private func addItems(_ viewController: MainScreenViewController) {
		let darkModeItem = UIBarButtonItem(image: UIImage(systemName: "sun.max"),
										   style: .plain,
										   target: self,
										   action: #selector(viewController.darkModeButtonAction))
		darkModeItem.tintColor = .lightGray
		viewController.navigationBar.topItem?.rightBarButtonItems = [darkModeItem]
	}
	
}
