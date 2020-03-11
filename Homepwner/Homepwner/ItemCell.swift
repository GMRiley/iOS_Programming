//
//  ItemCell.swift
//  Homepwner
//
//  Created by Riley, Kyle M on 3/11/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
    }
}
