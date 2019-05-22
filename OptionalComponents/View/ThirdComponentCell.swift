//
//  ThirdComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol ThirdComponentCellDelegate {
    func thirdComponentSliderChanged(cell: ThirdComponentCell, thirdComponent slider: UISlider)
}

class ThirdComponentCell: UITableViewCell {

    @IBOutlet weak var thirdComponentSlider: UISlider!
    @IBOutlet weak var thirdComponentLabel: UILabel!
    
    var delegate: ThirdComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func thirdComponentSliderValueChanged(_ sender: UISlider) {
        delegate?.thirdComponentSliderChanged(cell: self, thirdComponent: thirdComponentSlider)
    }
}
