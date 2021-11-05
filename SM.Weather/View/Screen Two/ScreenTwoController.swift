import UIKit


class ScreenTwoController: UIViewController {

    private let mapViewForScreenTwo = ScreenTwoMapView()
    
    override func viewDidLoad() {
		
		super.viewDidLoad()
        createMapView()
        view = mapViewForScreenTwo
        
    }
    
    private func createMapView() {
        
        mapViewForScreenTwo.center = view.center
        mapViewForScreenTwo.frame = view.frame
        
    }

}
