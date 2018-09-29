//
//  newButton.swift
//  Balot
//
//  Created by 1 on 18/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import UIKit

class newButton: UIButton {
    override func awakeFromNib() {
        backgroundColor = .clear
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
    }

}
