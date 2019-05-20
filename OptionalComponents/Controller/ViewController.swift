//
//  ViewController.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 20/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // Properties
    var inspectionItems: [Item] = []
    var isRowHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inspectionItems.append(Item(
            FirstComponent(firstComponentValue: 0, isVisible: true),
            SecondComponent(secondComponentValue: 0, isVisible: true),
            ThirdComponent(thirdComponentValue: 0, isVisible: true),
            FourthComponent(fourthComponentValue: Date(), isVisible: true),
            FifthComponent(fifthComponentValue: Date(), isVisible: true))
        )
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        // First Component
        case 0:
            if inspectionItems[indexPath.row].firstComponent?.isVisible == false {
                print("firstComponent not visible.")
                self.isRowHidden = true
            }
            else{
                print("firstComponent is visible.")
                self.isRowHidden = false
                let cell = tableView.dequeueReusableCell(withIdentifier: "firstComponentCell", for: indexPath)
                return cell
            }
            
        // Second Component
        case 1:
            if inspectionItems[indexPath.row].secondComponent?.isVisible == false {
                print("secondComponent not visible.")
                self.isRowHidden = true
            }
            else{
                print("secondComponent is visible.")
                self.isRowHidden = false
                let cell = tableView.dequeueReusableCell(withIdentifier: "secondComponentCell", for: indexPath)
                return cell
            }
            
        // Third Component
        case 2:
            if inspectionItems[indexPath.row].thirdComponent?.isVisible == false {
                print("thirdComponent not visible.")
                self.isRowHidden = true
            }
            else{
                print("thirdComponent is visible.")
                self.isRowHidden = false
                let cell = tableView.dequeueReusableCell(withIdentifier: "thirdComponentCell", for: indexPath)
                return cell
            }
            
        // Fourth Component
        case 3:
            if inspectionItems[indexPath.row].fourthComponent?.isVisible == false {
                print("fourthComponent not visible.")
                self.isRowHidden = true
            }
            else{
                print("fourthComponent is visible.")
                self.isRowHidden = false
                let cell = tableView.dequeueReusableCell(withIdentifier: "fourthComponentCell", for: indexPath)
                return cell
            }

        // Fifth Component
        case 4:
            if inspectionItems[indexPath.row].fifthComponent?.isVisible == false {
                print("fifthComponent not visible.")
                self.isRowHidden = true
            }
            else{
                print("fifthComponent is visible.")
                self.isRowHidden = false
                let cell = tableView.dequeueReusableCell(withIdentifier: "fifthComponentCell", for: indexPath)
                return cell
            }
  
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inspectionItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var cellHeight: CGFloat = 0
        switch indexPath.row {
            
        case 0:
            if isRowHidden{ cellHeight = 0 }
            else { cellHeight = 100 }
            return cellHeight
        case 1:
            if isRowHidden{ cellHeight = 0 }
            else { cellHeight = 100 }
            return cellHeight
        case 2:
            if isRowHidden{ cellHeight = 0 }
            else { cellHeight = 100 }
            return cellHeight
        case 3:
            if isRowHidden{ cellHeight = 0 }
            else { cellHeight = 200 }
            return cellHeight
        case 4:
            if isRowHidden{ cellHeight = 0 }
            else { cellHeight = 200 }
            return cellHeight
    
        default:
            return 200
        }
    }
}
