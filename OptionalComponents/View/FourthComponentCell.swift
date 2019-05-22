//
//  FourthComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol FourthComponentCellDelegate {
    func fourthComponentDateChanged(cell: FourthComponentCell, fourthComponent date: UIDatePicker)
}

class FourthComponentCell: UITableViewCell {

    @IBOutlet weak var fourthComponentDatePicker: UIDatePicker!
    
    var delegate: FourthComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func fourthComponentDatePickerValueChanged(_ sender: UIDatePicker) {
        delegate?.fourthComponentDateChanged(cell: self, fourthComponent: fourthComponentDatePicker)
    }
}
