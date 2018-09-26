//
//  Baloot.swift
//  Balot
//
//  Created by 1 on 06/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import Foundation

class Baloot {
    
    private var _we : Int
    private var _them: Int
    
    var we: Int {
        return _we
    }
    var them: Int {
        return _them
    }
    
    init(we: Int, them: Int) {
        self._we = we
        self._them = them
    }
}
