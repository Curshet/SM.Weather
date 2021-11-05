import UIKit


class ScreenOneCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let collectionCellIdentifier = "ScreenOneCollectionCell"
	
    //Number of items
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    //Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    
    //Height and width of cell
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 73, height: 110)
    }
    
    //Creating cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenOneCollectionDataSource.collectionCellIdentifier, for: indexPath)

        let labelUp = UILabel()
        labelUp.font.withSize(16)
        labelUp.textColor = .lightGray
        labelUp.textAlignment = .center
        labelUp.center.x = cell.center.x
        labelUp.frame = CGRect(x: cell.bounds.minX,
							   y: cell.center.y / 9,
							   width: cell.bounds.width,
							   height: cell.bounds.height / 4)
        
        let imageViewInCenter = UIImageView()
        imageViewInCenter.center = cell.center
        imageViewInCenter.frame = CGRect(x: cell.bounds.minX + 18,
										 y: cell.center.y / 2.5,
										 width: cell.bounds.width / 2,
										 height: cell.bounds.height / 3.5)
        
        let labelDown = UILabel()
        labelDown.font = UIFont.boldSystemFont(ofSize: 16)
        labelUp.textAlignment = .center
        labelDown.center.x = cell.center.x
        labelDown.frame = CGRect(x: cell.bounds.minX + 28,
								 y: cell.center.y / 1.3,
								 width: cell.bounds.width,
								 height: cell.bounds.height / 4)

        if indexPath.row == 0 {
            
            labelUp.text = "12:00"
            imageViewInCenter.image = imageInMiddleCollectionCellOne
            labelDown.text = labelDownForCollectionCellOne
            
        } else if indexPath.row == 1 {
            
            labelUp.text = "15:00"
            imageViewInCenter.image = imageInMiddleCollectionCellTwo
            labelDown.text = labelDownForCollectionCellTwo
            
        } else if indexPath.row == 2 {
            
            labelUp.text = "18:00"
            imageViewInCenter.image = imageInMiddleCollectionCellThree
            labelDown.text = labelDownForCollectionCellThree
            
        }  else if indexPath.row == 3 {
            
            labelUp.text = "21:00"
            imageViewInCenter.image = imageInMiddleCollectionCellFour
            labelDown.text = labelDownForCollectionCellFour
            
        } else if indexPath.row == 4 {
            
            labelUp.text = "00:00"
            imageViewInCenter.image = imageInMiddleCollectionCellFive
            labelDown.text = labelDownForCollectionCellFive
            
        }
        
        cell.addSubview(labelUp)
        cell.addSubview(imageViewInCenter)
        cell.addSubview(labelDown)
		cell.backgroundColor = UIColor(named: "TableCollectionCellColor")
        cell.layer.cornerRadius = 16
        
        return cell
        
    }
    
}
