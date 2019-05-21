
//  Created by Florentin Lupascu on 20/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import Foundation
import UIKit

protocol Component {
    var isVisible: Bool { set get }
}

class FirstComponent: Component {
    
    var firstComponentValue: Int
    var isVisible: Bool
    
    init(firstComponentValue: Int, isVisible: Bool) {
        self.firstComponentValue = firstComponentValue
        self.isVisible = isVisible
    }
}

class SecondComponent: Component {
    
    var secondComponentValue: Int
    var isVisible: Bool
    
    init(secondComponentValue: Int, isVisible: Bool) {
        self.secondComponentValue = secondComponentValue
        self.isVisible = isVisible
    }
}

class ThirdComponent: Component {
    
    var thirdComponentValue: Int
    var isVisible: Bool
    
    init(thirdComponentValue: Int, isVisible: Bool) {
        self.thirdComponentValue = thirdComponentValue
        self.isVisible = isVisible
    }
}

class FourthComponent: Component {
    
    var fourthComponentValue: Date
    var isVisible: Bool
    
    init(fourthComponentValue: Date, isVisible: Bool) {
        self.fourthComponentValue = fourthComponentValue
        self.isVisible = isVisible
    }
}

class FifthComponent: Component {
    
    var fifthComponentValue: Date
    var isVisible: Bool
    
    init(fifthComponentValue: Date, isVisible: Bool) {
        self.fifthComponentValue = fifthComponentValue
        self.isVisible = isVisible
    }
}
