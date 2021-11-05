import UIKit


class ScreenOneController: UINavigationController {
	
	private var darkModeState = false
	private let parcer = NetworkManager()
	private let tableViewController = ScreenOneTableController()
	private let screenTwoMapView = ScreenTwoController()
	private let screenThreeController = ScreenThreeController()
	private let storyBoard = UIStoryboard(name: "Main", bundle: nil)
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		//Waiting for JSON data download (bad solution)
		parcer.startProcess()
		if jsonData == nil { sleep(3) }
		
		tableViewController.viewDidLoad()
		createNavigationBar()
		view.addSubview(tableViewController.view)
		
	}
	
	//Creating Navigation Bar
	private func createNavigationBar() {
		
		navigationBar.topItem?.title = titleForNavigationBar
		navigationBar.isTranslucent = false
		navigationBar.shadowImage = UIImage()
		
		//Creating Navigation Bar buttons
		let geoPositionButton = UIBarButtonItem(
			image: UIImage(systemName: "map"),
			style: .plain,
			target: self,
			action: #selector(self.pressGeoPositionButton))
		geoPositionButton.tintColor = .gray
		
		
		let darkModeButton = UIBarButtonItem(
			image: UIImage(systemName: "sun.max"),
			style: .plain,
			target: self,
			action: #selector(self.pressDarkModeButton))
		darkModeButton.tintColor = geoPositionButton.tintColor
		
		
		let findCityButton = UIBarButtonItem(
			image: UIImage(systemName: "magnifyingglass"),
			style: .plain,
			target: self,
			action: #selector(self.pressFindCityButton))
		findCityButton.tintColor = geoPositionButton.tintColor
		
		navigationBar.topItem?.leftBarButtonItem = geoPositionButton
		navigationBar.topItem?.rightBarButtonItems = [findCityButton, darkModeButton]
		
	}
	
	//Action for Dark Mode Button
	@objc private func pressDarkModeButton() {
		
		darkModeState = !darkModeState
		
		if darkModeState {
			
			overrideUserInterfaceStyle = .dark
			
			for item in navigationBar.topItem!.leftBarButtonItems! {
				
				item.tintColor = .white
				
			}
			
			for item in navigationBar.topItem!.rightBarButtonItems! {
				
				item.tintColor = navigationBar.topItem!.leftBarButtonItem?.tintColor
				
			}
			
		} else {
			
			overrideUserInterfaceStyle = .light
			
			for item in navigationBar.topItem!.leftBarButtonItems! {
				
				item.tintColor = .gray
				
			}
			
			for item in navigationBar.topItem!.rightBarButtonItems! {
				
				item.tintColor = navigationBar.topItem?.leftBarButtonItem?.tintColor
				
			}
			
		}
		
	}
	
	//Action for back button of Navigation Bar
	@objc private func deleteCurrentScene() {
		popViewController(animated: true)
	}
	
	//Action for map button
	@objc private func pressGeoPositionButton() {
		
		let nextViewController = storyBoard.instantiateViewController(identifier: "geoPositionView")
		pushViewController(nextViewController, animated: false)
		
		navigationBar.topItem?.backBarButtonItem?.tintColor = .gray
		navigationBar.topItem?.backBarButtonItem = .init(image: UIImage(),
														 style: .plain,
														 target: self,
														 action: #selector(deleteCurrentScene))
		
	}
	
	//Action for list of cities button
	@objc private func pressFindCityButton() {
		
		screenThreeController.viewDidLoad()
		screenThreeController.tableViewForScreenThree.bounds = view.frame
		screenThreeController.tableViewForScreenThree.center = view.center
		
		let nextViewController = storyBoard.instantiateViewController(identifier: "findCityView")
		self.pushViewController(nextViewController, animated: true)
		
		navigationBar.topItem?.backBarButtonItem?.tintColor = .gray
		navigationBar.topItem?.backBarButtonItem = .init(image: UIImage(),
															  style: .plain,
															  target: self,
															  action: #selector(deleteCurrentScene))
		
	}
	
}
