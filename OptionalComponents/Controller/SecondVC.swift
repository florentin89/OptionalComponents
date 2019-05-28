//
//  SecondVC.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var receivedObject: ObjectModel!
    var valuesReceived: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        detailsTableView.tableFooterView = UIView()
        
        print("\nReceived comment: \(receivedObject.comment)")
        
        print("\n\n------ Received DATA ------")
        self.receivedObject?.components.printDebugDescription()
        
        print("Values received: \(valuesReceived)")
    }
}

extension SecondVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return receivedObject.components.count
        case 1: return 1
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Set the header of each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0: return "Visible Components" // return cells with Visible Components values
        case 1: return "Comment received" // return cell with the comment received
        default: return String()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

     
        switch indexPath.section {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "componentsCell", for: indexPath)
            
            for component in receivedObject.components{
                if let component = component as? FirstComponent {
                    print("FirstComponent, isVisible = \(component.isVisible), value = \(component.value)")
                    if component.isVisible{
                        //cell.textLabel?.text = "First component value: \(component.value)"
                        valuesReceived.append(component.value)
                    }
                }
                else if let component = component as? SecondComponent {
                    print("SecondComponent, isVisible = \(component.isVisible), value = \(component.value)")
                    if component.isVisible{
                        //cell.textLabel?.text = "Second component value: \(component.value)%"
                        valuesReceived.append(String(component.value))
                    }
                }
                else if let component = component as? ThirdComponent {
                    print("ThirdComponent, isVisible = \(component.isVisible), value = \(component.value)")
                    if component.isVisible{
                        //cell.textLabel?.text = "Third component value: \(component.value)%"
                        valuesReceived.append(String(component.value))
                    }
                }
                else if let component = component as? FourthComponent {
                    print("FourthComponent, isVisible = \(component.isVisible), value = \(component.value)")
                    if component.isVisible{
                        //cell.textLabel?.text = "Fourth component value: \(component.value.toString("dd/MM/yyyy HH:mm"))"
                        valuesReceived.append(component.value.toString("dd/MM/yyyy HH:mm"))
                    }
                }
                else if let component = component as? FifthComponent {
                    print("FifthComponent, isVisible = \(component.isVisible), value = \(component.value)")
                    if component.isVisible{
                        //cell.textLabel?.text = "Fifth component value: \(component.value.toString("dd/MM/yyyy HH:mm"))"
                        valuesReceived.append(component.value.toString("dd/MM/yyyy HH:mm"))
                    }
                }
                else {
                    print("unknown")
                }
            }
            
            for eachComponent in valuesReceived {
                cell.textLabel?.text = eachComponent
                return cell
            }
            
            return UITableViewCell()
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
            
            cell.textLabel?.text = "Comment received: \(receivedObject.comment)"
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension Date
{
    func toString(_ dateFormat: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
