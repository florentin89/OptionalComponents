//
//  FourthComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol FourthComponentCellDelegate {
    func fourthComponentDateChanged(fourthComponent: UIDatePicker)
}

class FourthComponentCell: UITableViewCell {

    @IBOutlet weak var fourthComponentDatePicker: UIDatePicker!
    
    var delegate: FourthComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func fourthComponentDatePickerValueChanged(_ sender: UIDatePicker) {
        
        delegate?.fourthComponentDateChanged(fourthComponent: fourthComponentDatePicker)
    }
}
