//
//  SecondComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol SecondComponentCellDelegate {
    func secondComponentSliderChanged(cell: SecondComponentCell, secondComponent slider: UISlider)
}

class SecondComponentCell: UITableViewCell {

    @IBOutlet weak var secondComponentSlider: UISlider!
    @IBOutlet weak var secondComponentLabel: UILabel!
    
    var delegate: SecondComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func secondComponentSliderValueChanged(_ sender: UISlider) {
        delegate?.secondComponentSliderChanged(cell: self, secondComponent: secondComponentSlider)
    }
}
