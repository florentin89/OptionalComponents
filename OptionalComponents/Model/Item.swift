
//  Created by Florentin Lupascu on 20/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var firstComponent: FirstComponent?
    var secondComponent: SecondComponent?
    var thirdComponent: ThirdComponent?
    var fourthComponent: FourthComponent?
    var fifthComponent: FifthComponent?

    init(_ firstComponent: FirstComponent?,
         _ secondComponent: SecondComponent?,
         _ thirdComponent: ThirdComponent?,
         _ fourthComponent: FourthComponent?,
         _ fifthComponent: FifthComponent?
         ){
        
        self.firstComponent = firstComponent
        self.secondComponent = secondComponent
        self.thirdComponent = thirdComponent
        self.fourthComponent = fourthComponent
        self.fifthComponent = fifthComponent

    }
}

class FirstComponent {
    
    var firstComponentValue: Int
    var isVisible: Bool
    
    init(firstComponentValue: Int, isVisible: Bool) {
        self.firstComponentValue = firstComponentValue
        self.isVisible = isVisible
    }
}

class SecondComponent {
    
    var secondComponentValue: Int
    var isVisible: Bool
    
    init(secondComponentValue: Int, isVisible: Bool) {
        self.secondComponentValue = secondComponentValue
        self.isVisible = isVisible
    }
}

class ThirdComponent {
    
    var thirdComponentValue: Int
    var isVisible: Bool
    
    init(thirdComponentValue: Int, isVisible: Bool) {
        self.thirdComponentValue = thirdComponentValue
        self.isVisible = isVisible
    }
}

class FourthComponent {
    
    var fourthComponentValue: Date
    var isVisible: Bool
    
    init(fourthComponentValue: Date, isVisible: Bool) {
        self.fourthComponentValue = fourthComponentValue
        self.isVisible = isVisible
    }
}

class FifthComponent {
    
    var fifthComponentValue: Date
    var isVisible: Bool
    
    init(fifthComponentValue: Date, isVisible: Bool) {
        self.fifthComponentValue = fifthComponentValue
        self.isVisible = isVisible
    }
}
