//
//  ObjectToSent.swift
//  OptionalComponents
//
//  Created by Florentin Lupascu on 28/05/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import Foundation

class ObjectModel {
    
    var comment: String
    var components: [Component]
    
    init(comment:String, components: [Component]) {
        self.comment = comment
        self.components = components
    }
}
