//
//  FirstComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol FirstComponentCellDelegate {
    func firstComponentTextfieldChanged(cell: FirstComponentCell, firstComponent textfield: UITextField)
}

class FirstComponentCell: UITableViewCell {

    @IBOutlet weak var firstComponentTextfield: UITextField!
    
    var delegate: FirstComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func firstComponentTextfieldChanged(_ sender: UITextField) {
        delegate?.firstComponentTextfieldChanged(cell: self, firstComponent: firstComponentTextfield)
    }
}
