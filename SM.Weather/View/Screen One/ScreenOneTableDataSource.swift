import UIKit


class ScreenOneTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    static let tableCellIdentifier = "ScreenOneTableCell"
    
    //Big Cell Content
    private let imageViewForBigCell = UIImageView()
    private let viewForBigCell = UIView()
    private let labelUp = UILabel()
    private let animationView = UIImageView()
    private let labelDownOne = UILabel()
    private let labelDownTwo = UILabel()
	
    //Number of sections
	func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
    }
    
    //Heith of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 335
        } else {
            return 210
        }
        
    }

    //Creating table cell
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreenOneTableDataSource.tableCellIdentifier, for: indexPath)
        
        if indexPath.row == 0 {
            
            //First background View in Big Cell
            imageViewForBigCell.image = {
                
                let date = Date()
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date)
                
                if hour >= 23 {
                    return UIImage(named: "ScreenBackgroundImageDark")
                } else {
                    return UIImage(named: "ScreenBackgroundImageLight")
                }
                
            }()
            
            imageViewForBigCell.center = cell.center
            imageViewForBigCell.layer.cornerRadius = 30
            imageViewForBigCell.frame = CGRect(x: cell.bounds.minX + 20,
											   y: cell.bounds.minY + 10,
											   width: cell.bounds.width - 40,
											   height: cell.bounds.height - 20)
            
            //View inside big cell above first Image View
            viewForBigCell.frame = imageViewForBigCell.bounds

            //AnimationView in center of Big Cell
            animationView.image = returnActualWeatherImage(statusOfWeatherBigCell, true)
            animationView.translatesAutoresizingMaskIntoConstraints = false
			animationView.contentMode = .scaleAspectFit
            viewForBigCell.addSubview(animationView)

            //Constraints for central Image View of weather status
            NSLayoutConstraint.activate([
				animationView.leftAnchor.constraint(equalTo: viewForBigCell.leftAnchor),
				animationView.rightAnchor.constraint(equalTo: viewForBigCell.rightAnchor),
				animationView.topAnchor.constraint(equalTo: viewForBigCell.topAnchor, constant: 100)])
            
            //LabelUp inside big cell
            labelUp.text = labelUpForBigTableCell
            labelUp.textAlignment = .center
            labelUp.textColor = .white
            labelUp.font = .systemFont(ofSize: 17)
            labelUp.frame = CGRect(x: 0,
								   y: viewForBigCell.center.y - 150,
								   width: viewForBigCell.bounds.width,
								   height: CGFloat(viewForBigCell.bounds.height / 5))
            labelUp.center.x = viewForBigCell.center.x
            
            //LabelDownOne inside big cell
            labelDownOne.text = labelDownOneForBigTableCell
            labelDownOne.textAlignment = .center
            labelDownOne.textColor = .white
            labelDownOne.font = UIFont.boldSystemFont(ofSize: 40)
            labelDownOne.frame = CGRect(x: 0,
										y: viewForBigCell.center.y,
										width: viewForBigCell.bounds.width,
										height: CGFloat(viewForBigCell.bounds.height / 2))
            labelDownOne.center.x = viewForBigCell.center.x
            
            //LabelDownTwo inside big cell
            labelDownTwo.text = labelDownTwoForBigTableCell
            labelDownTwo.textAlignment = .center
            labelDownTwo.textColor = .white
            labelDownTwo.font = .systemFont(ofSize: 16)
            labelDownTwo.frame = CGRect(x: 0,
										y: viewForBigCell.center.y + 95,
										width: viewForBigCell.bounds.width,
										height: CGFloat(viewForBigCell.bounds.height / 5))
            labelDownTwo.center.x = viewForBigCell.center.x
            
            viewForBigCell.addSubview(labelUp)
            viewForBigCell.addSubview(labelDownOne)
            viewForBigCell.addSubview(labelDownTwo)
            imageViewForBigCell.addSubview(viewForBigCell)
            
            cell.addSubview(imageViewForBigCell)
            
            return cell
            
        } else {
            
            //View inside small cell
            let viewForSmallCell = UIView()
            viewForSmallCell.center = cell.center
            viewForSmallCell.frame = CGRect(x: cell.bounds.minX + 20,
											y: cell.bounds.minY + 10,
											width: cell.bounds.width - 40,
											height: cell.bounds.height - 10)
            viewForSmallCell.layer.cornerRadius = 22
            
            //LeftLabel inside Small Cells
            let leftLabel = UILabel()
            leftLabel.frame = CGRect(x: viewForSmallCell.bounds.maxX / 12,
									 y: viewForSmallCell.bounds.maxY / 12,
									 width: viewForSmallCell.bounds.width / 2.5,
									 height: CGFloat(viewForSmallCell.bounds.height / 8))
            
            //RightLabelOne inside Small Cells
            let rightLabelOne = UILabel()
            rightLabelOne.font = UIFont.boldSystemFont(ofSize: 16)
            rightLabelOne.frame =
				CGRect(x: viewForSmallCell.bounds.maxX - ((viewForSmallCell.bounds.maxX - leftLabel.bounds.maxX) / 2) - 20,
					   y: viewForSmallCell.bounds.maxY / 12,
					   width: viewForSmallCell.bounds.width / 14,
					   height: CGFloat(viewForSmallCell.bounds.height / 8))
            
            //RightLabelTwo inside small cell
            let rightLabelTwo = UILabel()
            rightLabelTwo.font = UIFont.boldSystemFont(ofSize: 16)
            rightLabelTwo.textColor = .lightGray
            rightLabelTwo.frame =
				CGRect(x: viewForSmallCell.bounds.maxX - ((viewForSmallCell.bounds.maxX - leftLabel.bounds.maxX) / 3) - 25,
					   y: viewForSmallCell.bounds.maxY / 12,
					   width: viewForSmallCell.bounds.width / 13,
					   height: CGFloat(viewForSmallCell.bounds.height / 8))
            
            //Right image inside small cell
            let rightImageView = UIImageView()
            rightImageView.frame =
				CGRect(x: viewForSmallCell.bounds.maxX - ((viewForSmallCell.bounds.maxX - leftLabel.bounds.maxX) / 4),
					   y: viewForSmallCell.bounds.maxY / 12,
					   width: viewForSmallCell.bounds.width / 13,
					   height: CGFloat(viewForSmallCell.bounds.height / 8))
            
            //Separator image inside small cell
            let separatorImageView = UIImageView()
            separatorImageView.backgroundColor = UIColor(cgColor: .init(genericGrayGamma2_2Gray: 0.6,
																		alpha: 0.5))
            separatorImageView.frame =
				CGRect(x: leftLabel.bounds.minX,
					   y: viewForSmallCell.center.y / 2,
					   width: rightImageView.frame.maxX - leftLabel.frame.minX,
					   height: viewForSmallCell.bounds.height / 150)
            separatorImageView.center.x = viewForSmallCell.center.x - 20
            
            //Collection View inside small cell
            let collectionView = ScreenOneCollection()
            collectionView.createCollection()
            collectionView.frame =
				CGRect(x: separatorImageView.bounds.minX,
					   y: separatorImageView.bounds.maxY + 30,
					   width: viewForSmallCell.bounds.maxX - viewForSmallCell.bounds.minX,
					   height: viewForSmallCell.bounds.maxY - separatorImageView.bounds.maxY - 5)
            collectionView.backgroundColor = viewForSmallCell.backgroundColor
            collectionView.layer.cornerRadius = 30
            collectionView.contentInset = UIEdgeInsets(top: 0,
													   left: separatorImageView.frame.minX,
													   bottom: 0,
													   right: separatorImageView.frame.minX)
            
            if indexPath.row == 1 {
                
                leftLabel.text = leftLabelForSmallCellOne
                rightLabelOne.text = rightLabelOneSmallCellOne
                rightLabelTwo.text = rightLabelTwoSmallCellOne
                rightImageView.image = returnActualWeatherImage(statusOfWeatherSmallCellOne, false)
                
            } else if indexPath.row == 2 {
                
                leftLabel.text = leftLabelForSmallCellTwo
                rightLabelOne.text = rightLabelOneSmallCellTwo
                rightLabelTwo.text = rightLabelTwoSmallCellTwo
                rightImageView.image = returnActualWeatherImage(statusOfWeatherSmallCellTwo, false)
                
                //Edit content of collection cell
                statusOfWeatherCollectionCellOne = jsonData!.list[19].weather[0].weatherDescription
                statusOfWeatherCollectionCellThree = jsonData!.list[20].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[21].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[22].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[23].weather[0].weatherDescription
                
                imageInMiddleCollectionCellOne = returnActualWeatherImage(statusOfWeatherCollectionCellOne, false)
                imageInMiddleCollectionCellTwo = returnActualWeatherImage(statusOfWeatherCollectionCellTwo, false)
                imageInMiddleCollectionCellThree = returnActualWeatherImage(statusOfWeatherCollectionCellThree, false)
                imageInMiddleCollectionCellFour = returnActualWeatherImage(statusOfWeatherCollectionCellFour, false)
                imageInMiddleCollectionCellFive = returnActualWeatherImage(statusOfWeatherCollectionCellFive, false)
                
                labelDownForCollectionCellOne = String(Int(jsonData!.list[19].main.temp)) + temperatureSymbol
                labelDownForCollectionCellTwo = String(Int(jsonData!.list[20].main.temp)) + temperatureSymbol
                labelDownForCollectionCellThree = String(Int(jsonData!.list[21].main.temp)) + temperatureSymbol
                labelDownForCollectionCellFour = String(Int(jsonData!.list[22].main.temp)) + temperatureSymbol
                labelDownForCollectionCellFive = String(Int(jsonData!.list[23].main.temp)) + temperatureSymbol
                
            } else if indexPath.row == 3 {
                
                leftLabel.text = leftLabelForSmallCellThree
                rightLabelOne.text = rightLabelOneSmallCellThree
                rightLabelTwo.text = rightLabelTwoSmallCellThree
                rightImageView.image = returnActualWeatherImage(statusOfWeatherSmallCellThree, false)
                
                //Edit Collection Cell Content
                statusOfWeatherCollectionCellOne = jsonData!.list[27].weather[0].weatherDescription
                statusOfWeatherCollectionCellThree = jsonData!.list[28].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[29].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[30].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[31].weather[0].weatherDescription
                
                imageInMiddleCollectionCellOne = returnActualWeatherImage(statusOfWeatherCollectionCellOne, false)
                imageInMiddleCollectionCellTwo = returnActualWeatherImage(statusOfWeatherCollectionCellTwo, false)
                imageInMiddleCollectionCellThree = returnActualWeatherImage(statusOfWeatherCollectionCellThree, false)
                imageInMiddleCollectionCellFour = returnActualWeatherImage(statusOfWeatherCollectionCellFour, false)
                imageInMiddleCollectionCellFive = returnActualWeatherImage(statusOfWeatherCollectionCellFive, false)
                
                labelDownForCollectionCellOne = String(Int(jsonData!.list[27].main.temp)) + temperatureSymbol
                labelDownForCollectionCellTwo = String(Int(jsonData!.list[28].main.temp)) + temperatureSymbol
                labelDownForCollectionCellThree = String(Int(jsonData!.list[29].main.temp)) + temperatureSymbol
                labelDownForCollectionCellFour = String(Int(jsonData!.list[30].main.temp)) + temperatureSymbol
                labelDownForCollectionCellFive = String(Int(jsonData!.list[31].main.temp)) + temperatureSymbol
                
            } else if indexPath.row == 4 {
                
                leftLabel.text = leftLabelForSmallCellFour
                rightLabelOne.text = rightLabelOneSmallCellFour
                rightLabelTwo.text = rightLabelTwoSmallCellFour
                rightImageView.image = returnActualWeatherImage(statusOfWeatherSmallCellFour, false)
                
                //Edit Collection Cell Content
                statusOfWeatherCollectionCellOne = jsonData!.list[35].weather[0].weatherDescription
                statusOfWeatherCollectionCellThree = jsonData!.list[36].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[37].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[38].weather[0].weatherDescription
                statusOfWeatherCollectionCellTwo = jsonData!.list[39].weather[0].weatherDescription
                
                imageInMiddleCollectionCellOne = returnActualWeatherImage(statusOfWeatherCollectionCellOne, false)
                imageInMiddleCollectionCellTwo = returnActualWeatherImage(statusOfWeatherCollectionCellTwo, false)
                imageInMiddleCollectionCellThree = returnActualWeatherImage(statusOfWeatherCollectionCellThree, false)
                imageInMiddleCollectionCellFour = returnActualWeatherImage(statusOfWeatherCollectionCellFour, false)
                imageInMiddleCollectionCellFive = returnActualWeatherImage(statusOfWeatherCollectionCellFive, false)
                
                labelDownForCollectionCellOne = String(Int(jsonData!.list[33].main.temp)) + temperatureSymbol
                labelDownForCollectionCellTwo = String(Int(jsonData!.list[34].main.temp)) + temperatureSymbol
                labelDownForCollectionCellThree = String(Int(jsonData!.list[35].main.temp)) + temperatureSymbol
                labelDownForCollectionCellFour = String(Int(jsonData!.list[36].main.temp)) + temperatureSymbol
                labelDownForCollectionCellFive = String(Int(jsonData!.list[37].main.temp)) + temperatureSymbol
                
            }
            
			viewForSmallCell.backgroundColor = UIColor.init(named: "TableCellColor")
            viewForSmallCell.addSubview(leftLabel)
            viewForSmallCell.addSubview(rightLabelOne)
            viewForSmallCell.addSubview(rightLabelTwo)
            viewForSmallCell.addSubview(rightImageView)
            viewForSmallCell.addSubview(separatorImageView)
            viewForSmallCell.addSubview(collectionView)
			cell.addSubview(viewForSmallCell)

            return cell
            
        }
        
    }

}
