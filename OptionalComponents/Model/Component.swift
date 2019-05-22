
//  Created by Florentin Lupascu on 20/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import Foundation
import UIKit

protocol Component {
    var isVisible: Bool { set get }
}

class FirstComponent: Component {
    
    var value: String
    var isVisible: Bool
    
    init(value: String, isVisible: Bool) {
        self.value = value
        self.isVisible = isVisible
    }
}

class SecondComponent: Component {
    
    var value: Int
    var isVisible: Bool
    
    init(value: Int, isVisible: Bool) {
        self.value = value
        self.isVisible = isVisible
    }
}

class ThirdComponent: Component {
    
    var value: Int
    var isVisible: Bool
    
    init(value: Int, isVisible: Bool) {
        self.value = value
        self.isVisible = isVisible
    }
}

class FourthComponent: Component {
    
    var value: Date
    var isVisible: Bool
    
    init(value: Date, isVisible: Bool) {
        self.value = value
        self.isVisible = isVisible
    }
}

class FifthComponent: Component {
    
    var value: Date
    var isVisible: Bool
    
    init(value: Date, isVisible: Bool) {
        self.value = value
        self.isVisible = isVisible
    }
}
