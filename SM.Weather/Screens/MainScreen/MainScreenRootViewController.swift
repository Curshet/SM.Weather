import UIKit

class MainScreenRootViewController: UITableViewController, MainScreenRootViewProtocol {
	
	private var presenter: MainScreenPresenterProtocol!
	private var rootView = MainScreenView()
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		let dataPresenter = MainScreenPresenter()
		dataPresenter.view = self
		presenter = dataPresenter
	}
	
	override func loadView() {
		tableView = rootView
		tableView.delegate = self
		let refreshProcess = UIRefreshControl()
		refreshProcess.addTarget(self, action: #selector(refreshProcessor), for: .valueChanged)
		refreshControl = refreshProcess
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		presenter.loadData()
	}
	
	@objc private func refreshProcessor(_ control: UIRefreshControl) {
		presenter.loadData()
		control.endRefreshing()
	}
	
	public func setContentToCells(cellContent: [TableCellProtocol], titleText: String) {
		rootView.setDataToCells(cellContent: cellContent)
		title = titleText
	}
	
	public func errorCase() {
		present(ErrorAlertController().returnErrorMessage(), animated: true, completion: nil)
	}
	
}
