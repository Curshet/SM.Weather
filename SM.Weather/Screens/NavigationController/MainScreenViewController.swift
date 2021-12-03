import UIKit

class MainScreenViewController: UINavigationController {
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		MainScreenNavBarSet().navigationBarStyle(self)
	}
	
}
