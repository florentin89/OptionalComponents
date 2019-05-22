//
//  SecondVC.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var visibleComponents: [Component]?
    
    @IBOutlet weak var firstComponentLabel: UILabel!
    @IBOutlet weak var secondComponentLabel: UILabel!
    @IBOutlet weak var thirdComponentLabel: UILabel!
    @IBOutlet weak var fourthComponentLabel: UILabel!
    @IBOutlet weak var fifthComponentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\n\n------ Received DATA ------")
        
        for component in visibleComponents ?? [] {
            if let component = component as? FirstComponent {
                print("FirstComponent, isVisible = \(component.isVisible), value = \(component.value)")
                if component.isVisible{
                    firstComponentLabel.text = "First component value: \(component.value)"
                }
            }
            else if let component = component as? SecondComponent {
                print("SecondComponent, isVisible = \(component.isVisible), value = \(component.value)")
                if component.isVisible{
                    secondComponentLabel.text = "Second component value: \(component.value)%"
                }
            }
            else if let component = component as? ThirdComponent {
                print("ThirdComponent, isVisible = \(component.isVisible), value = \(component.value)")
                if component.isVisible{
                    thirdComponentLabel.text = "Third component value: \(component.value)%"
                }
            }
            else if let component = component as? FourthComponent {
                print("FourthComponent, isVisible = \(component.isVisible), value = \(component.value)")
                if component.isVisible{
                    fourthComponentLabel.text = "Fourth component value: \(component.value.toString("dd/MM/yyyy HH:mm"))"
                }
            }
            else if let component = component as? FifthComponent {
                print("FifthComponent, isVisible = \(component.isVisible), value = \(component.value)")
                if component.isVisible{
                    fifthComponentLabel.text = "Fifth component value: \(component.value.toString("dd/MM/yyyy HH:mm"))"
                }
            }
            else {
                print("unknown")
            }
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
