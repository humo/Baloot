//
//  BlootTableViewCell.swift
//  Balot
//
//  Created by 1 on 05/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import UIKit

class BlootTableViewCell: UITableViewCell {

  
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ThemLabel: UILabel!
    @IBOutlet weak var OurLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(Them: Int, Our: Int) {
        ThemLabel.text = String(Them)
        OurLable.text = String(Our)
    }
    

}
