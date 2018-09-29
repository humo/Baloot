//
//  Result.swift
//  Balot
//
//  Created by 1 on 18/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import Foundation

class Result {
    
    private var _id : String!
    private var _we : String!
    private var _They: String!
   
    var id: String {
        return _id
    }
    var we: String {
        return _we
    }
    var They: String {
        return _They
    }
    
    init(id: String, we: String, They: String) {
        self._id = id
        self._we = we
        self._They = They
        
    }
}
