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
    var inspectionItems: [Component] = [
        FirstComponent(firstComponentValue: 0, isVisible: true),
        SecondComponent(secondComponentValue: 0, isVisible: true),
        ThirdComponent(thirdComponentValue: 0, isVisible: true),
        FourthComponent(fourthComponentValue: Date(), isVisible: true),
        FifthComponent(fifthComponentValue: Date(), isVisible: true)
    ]
    
    // Visible components.
    var visibleItems: [Component] {
        return self.inspectionItems.filter { $0.isVisible }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.visibleItems[indexPath.row] is FirstComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstComponentCell", for: indexPath)
            return cell
            
        } else if self.visibleItems[indexPath.row] is SecondComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondComponentCell", for: indexPath)
            return cell
            
        } else if self.visibleItems[indexPath.row] is ThirdComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdComponentCell", for: indexPath)
            return cell
            
        } else if self.visibleItems[indexPath.row] is FourthComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthComponentCell", for: indexPath)
            return cell
            
        } else if self.visibleItems[indexPath.row] is FifthComponent {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fifthComponentCell", for: indexPath)
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.visibleItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.visibleItems[indexPath.row] {
        case is FirstComponent: return 100
        case is SecondComponent: return 100
        case is ThirdComponent: return 100
        case is FourthComponent: return 200
        case is FifthComponent: return 200
        default: return 200
        }
    }
    
    /// This method is used in iOS = 10.0.
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionHide = UITableViewRowAction(style: .destructive, title: "Hide") { action, indexPath in
            var component = self.visibleItems[indexPath.row]
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
            var component = self.visibleItems[indexPath.row]
            component.isVisible = false
            self.tableView.deleteRows(at: [indexPath], with: .none)
            handler(true)
        }
        
        actionHide.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [actionHide])
    }
}
