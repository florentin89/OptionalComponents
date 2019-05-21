//
//  SecondComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol SecondComponentCellDelegate {
    func secondComponentSliderChanged(secondComponent: UISlider)
}

class SecondComponentCell: UITableViewCell {

    @IBOutlet weak var secondComponentSlider: UISlider!
    
    var delegate: SecondComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func secondComponentSliderValueChanged(_ sender: UISlider) {
    
        delegate?.secondComponentSliderChanged(secondComponent: secondComponentSlider)
    }
    
}
