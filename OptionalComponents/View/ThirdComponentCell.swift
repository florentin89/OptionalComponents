//
//  ThirdComponentCell.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 21/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol ThirdComponentCellDelegate {
    func thirdComponentSliderChanged(thirdComponent: UISlider)
}

class ThirdComponentCell: UITableViewCell {

    @IBOutlet weak var thirdComponentSlider: UISlider!
    
    var delegate: ThirdComponentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func thirdComponentSliderValueChanged(_ sender: UISlider) {
        delegate?.thirdComponentSliderChanged(thirdComponent: thirdComponentSlider)
    }
}
