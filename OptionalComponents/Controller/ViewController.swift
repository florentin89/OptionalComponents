//
//  ViewController.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 20/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // All components.
    var components: [Component] = [
        FirstComponent(value: String(), isVisible: true),
        SecondComponent(value: 0, isVisible: true),
        ThirdComponent(value: 0, isVisible: true),
        FourthComponent(value: Date(), isVisible: true),
        FifthComponent(value: Date(), isVisible: true)
    ]
    
    // Visible components.
    var visibleComponents: [Component] {
        return self.components.filter { $0.isVisible }
    }
    
    var objectToSent: ObjectModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.title = "First View Ctrl"
    }
    
    @IBAction func nextBtnTapped(_ sender: UIBarButtonItem) {
        
        print("\n\n------- PASSED VALUES --------")
        self.visibleComponents.printDebugDescription()
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        self.objectToSent = ObjectModel(comment: "Swift 5 FTW", components: visibleComponents)
        
        secondVC.receivedObject = self.objectToSent

        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let component = self.visibleComponents[indexPath.row] as? FirstComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstComponentCell", for: indexPath) as! FirstComponentCell
            cell.delegate = self
            cell.firstComponentTextfield.text = component.value
            cell.firstComponentTextfield.tag = indexPath.row
            return cell
            
        } else if let component = self.visibleComponents[indexPath.row] as? SecondComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondComponentCell", for: indexPath) as! SecondComponentCell
            cell.delegate = self
            cell.secondComponentSlider.value = Float(component.value)
            cell.secondComponentSlider.tag = indexPath.row
            return cell
            
        } else if let component = self.visibleComponents[indexPath.row] as? ThirdComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdComponentCell", for: indexPath) as! ThirdComponentCell
            cell.delegate = self
            cell.thirdComponentSlider.value = Float(component.value)
            cell.thirdComponentSlider.tag = indexPath.row
            return cell
            
        } else if let component = self.visibleComponents[indexPath.row] as? FourthComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthComponentCell", for: indexPath) as! FourthComponentCell
            cell.delegate = self
            cell.fourthComponentDatePicker.date = component.value
            cell.fourthComponentDatePicker.tag = indexPath.row
            return cell
            
        } else if let component = self.visibleComponents[indexPath.row] as? FifthComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fifthComponentCell", for: indexPath) as! FifthComponentCell
            cell.delegate = self
            cell.fifthComponentDatePicker.date = component.value
            cell.fifthComponentDatePicker.tag = indexPath.row
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

extension Array {
    func printDebugDescription() {
        for component in self {
            if let component = component as? FirstComponent {
                print("FirstComponent, isVisible = \(component.isVisible), value = \(component.value)")
            } else if let component = component as? SecondComponent {
                print("SecondComponent, isVisible = \(component.isVisible), value = \(component.value)")
            } else if let component = component as? ThirdComponent {
                print("ThirdComponent, isVisible = \(component.isVisible), value = \(component.value)")
            } else if let component = component as? FourthComponent {
                print("FourthComponent, isVisible = \(component.isVisible), value = \(component.value)")
            } else if let component = component as? FifthComponent {
                print("FifthComponent, isVisible = \(component.isVisible), value = \(component.value)")
            } else if let component = component as? Component {
                print("unknown component, isVisible = \(component.isVisible)")
            } else {
                print("unknown")
            }
        }
    }
}

extension ViewController: FirstComponentCellDelegate{
    func firstComponentTextfieldChanged(cell: FirstComponentCell, firstComponent textfield: UITextField) {
        
        let component = self.visibleComponents[textfield.tag] as! FirstComponent
        component.value = textfield.text ?? String()
    }
}

extension ViewController: SecondComponentCellDelegate{
    
    func secondComponentSliderChanged(cell: SecondComponentCell, secondComponent slider: UISlider) {
        
        let component = self.visibleComponents[slider.tag] as! SecondComponent
        component.value = Int(slider.value) - Int(slider.value) % 10
        cell.secondComponentLabel.text = "\(component.value) %"
    }
}

extension ViewController: ThirdComponentCellDelegate{
    func thirdComponentSliderChanged(cell: ThirdComponentCell, thirdComponent slider: UISlider) {
        
        let component = self.visibleComponents[slider.tag] as! ThirdComponent
        component.value = Int(slider.value) - Int(slider.value) % 10
        cell.thirdComponentLabel.text = "\(component.value) %"
    }
}

extension ViewController: FourthComponentCellDelegate{
    func fourthComponentDateChanged(cell: FourthComponentCell, fourthComponent date: UIDatePicker) {
        
        let component = self.visibleComponents[date.tag] as! FourthComponent
        component.value = date.date
    }
}

extension ViewController: FifthComponentCellDelegate{
    func fifthComponentDateChanged(cell: FifthComponentCell, fifthComponent date: UIDatePicker) {
        
        let component = self.visibleComponents[date.tag] as! FifthComponent
        component.value = date.date
    }
}
