//
//  FifthComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol FifthComponentCellDelegate {
    func fifthComponentDateChanged(fifthComponent: UIDatePicker)
}

class FifthComponentCell: UITableViewCell {

    @IBOutlet weak var fifthComponentDatePicker: UIDatePicker!
    
    var delegate: FifthComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func fifthComponentDatePickerValueChanged(_ sender: UIDatePicker) {
        
        delegate?.fifthComponentDateChanged(fifthComponent: fifthComponentDatePicker)
    }
}
