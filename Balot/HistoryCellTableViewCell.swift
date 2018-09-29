//
//  HistoryCellTableViewCell.swift
//  Balot
//
//  Created by 1 on 18/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import UIKit

class HistoryCellTableViewCell: UITableViewCell {
    @IBOutlet weak var They: UILabel!
    @IBOutlet weak var We: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(Them: String, Our: String) {
        We.text = Our
        They.text = Them
    }

    
}
