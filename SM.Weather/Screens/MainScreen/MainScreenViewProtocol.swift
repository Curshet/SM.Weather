import Foundation

protocol MainScreenRootViewProtocol: AnyObject {
	func setContentToCells(cellContent: [TableCellProtocol], titleText: String)
	func errorCase()
}
