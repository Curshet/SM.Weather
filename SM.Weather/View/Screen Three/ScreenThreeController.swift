import UIKit


class ScreenThreeController: UITableViewController {
    
    public let tableViewForScreenThree = ScreenThreeTable()
    
    override func viewDidLoad() {
		
		super.viewDidLoad()
        tableViewForScreenThree.createTable()
        view = tableViewForScreenThree
        
    }

}
