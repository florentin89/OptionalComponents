//
//  ViewController.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 20/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var firstComponentValue = ""
    var secondComponentValue = 0
    var thirdComponentValue = 0
    var fourthComponentValue = Date()
    var fifthComponentValue = Date()
    var indexPath: [IndexPath] = []
    
    // All components.
    var components: [Component] = [
        FirstComponent(firstComponentValue: "", isVisible: true),
        SecondComponent(secondComponentValue: 0, isVisible: true),
        ThirdComponent(thirdComponentValue: 0, isVisible: true),
        FourthComponent(fourthComponentValue: Date(), isVisible: true),
        FifthComponent(fifthComponentValue: Date(), isVisible: true)
    ]
    
    // Visible components.
    var visibleComponents: [Component] {
        return self.components.filter { $0.isVisible }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        indexPath = tableView.visibleCells
            .compactMap { tableView.indexPath(for: $0) }
            .filter { $0.section == 0 }
    }
    
    @IBAction func nextBtnTapped(_ sender: UIBarButtonItem) {
    
        components = [
            FirstComponent(firstComponentValue: firstComponentValue, isVisible: true),
            SecondComponent(secondComponentValue: secondComponentValue, isVisible: true),
            ThirdComponent(thirdComponentValue: thirdComponentValue, isVisible: true),
            FourthComponent(fourthComponentValue: fourthComponentValue, isVisible: true),
            FifthComponent(fifthComponentValue: fifthComponentValue, isVisible: true)
        ]
        
        print("******** SAVED DATA ********")

        if let firstComponent = self.components[indexPath[0].row] as? FirstComponent {
            print("First Component Value: \(firstComponent.firstComponentValue)\n" )
        }
        if let secondComponent = self.components[indexPath[1].row] as? SecondComponent {
            print("Second Component Value: \(secondComponent.secondComponentValue)\n" )
        }
        if let thirdComponent = self.components[indexPath[2].row] as? ThirdComponent {
            print("Third Component Value: \(thirdComponent.thirdComponentValue)\n" )
        }
        if let fourthComponent = self.components[indexPath[3].row] as? FourthComponent {
            print("Fourth Component Value: \(fourthComponent.fourthComponentValue)\n" )
        }
        if let fifthComponent = self.components[indexPath[4].row] as? FifthComponent {
            print("Fifth Component Value: \(fifthComponent.fifthComponentValue)\n" )
        }

        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.visibleComponents[indexPath.row] is FirstComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstComponentCell", for: indexPath) as! FirstComponentCell
            cell.delegate = self
            return cell
            
        } else if self.visibleComponents[indexPath.row] is SecondComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondComponentCell", for: indexPath) as! SecondComponentCell
            cell.delegate = self
            return cell
            
        } else if self.visibleComponents[indexPath.row] is ThirdComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdComponentCell", for: indexPath) as! ThirdComponentCell
            cell.delegate = self
            return cell
            
        } else if self.visibleComponents[indexPath.row] is FourthComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthComponentCell", for: indexPath) as! FourthComponentCell
            cell.delegate = self
            return cell
            
        } else if self.visibleComponents[indexPath.row] is FifthComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fifthComponentCell", for: indexPath) as! FifthComponentCell
            cell.delegate = self
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.visibleComponents.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.visibleComponents[indexPath.row] {
        case is FirstComponent: return 250
        case is SecondComponent: return 250
        case is ThirdComponent: return 250
        case is FourthComponent: return 250
        case is FifthComponent: return 250
        default: return 200
        }
    }
    
    /// This method is used in iOS = 10.0.
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionHide = UITableViewRowAction(style: .destructive, title: "Hide") { action, indexPath in
            var component = self.visibleComponents[indexPath.row]
            component.isVisible = false
            self.tableView.deleteRows(at: [indexPath], with: .left)
        }
        
        actionHide.backgroundColor = UIColor.red
        return [actionHide]
    }
    
    /// This method is used in iOS >= 11.0 instead of `editActionsForRowAt`.
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionHide = UIContextualAction(style: .destructive, title: "Hide") { action, view, handler in
            var component = self.visibleComponents[indexPath.row]
            component.isVisible = false
            self.tableView.deleteRows(at: [indexPath], with: .none)
            handler(true)
        }
        
        actionHide.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [actionHide])
    }
}

extension ViewController: FirstComponentCellDelegate{
    func firstComponentTextfieldChanged(firstComponent: UITextField) {
        
        firstComponentValue = firstComponent.text!
    }
}

extension ViewController: SecondComponentCellDelegate{
    func secondComponentSliderChanged(secondComponent: UISlider) {
        secondComponentValue = Int(secondComponent.value)
    }
}

extension ViewController: ThirdComponentCellDelegate{
    func thirdComponentSliderChanged(thirdComponent: UISlider) {
        thirdComponentValue = Int(thirdComponent.value)
    }
}

extension ViewController: FourthComponentCellDelegate{
    func fourthComponentDateChanged(fourthComponent: UIDatePicker) {
        fourthComponentValue = fourthComponent.date
    }
}

extension ViewController: FifthComponentCellDelegate{
    func fifthComponentDateChanged(fifthComponent: UIDatePicker) {
        fifthComponentValue = fifthComponent.date
    }
}
