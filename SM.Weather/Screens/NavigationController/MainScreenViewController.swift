import UIKit

class MainScreenViewController: UINavigationController {
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		MainScreenNavBarSetup().navigationBarStyle(self)
	}
	
}
