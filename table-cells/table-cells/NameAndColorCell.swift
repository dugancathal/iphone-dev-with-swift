//
//  NameAndColorCell.swift
//  table-cells
//
//  Created by TJ Taylor on 1/20/15.
//  Copyright (c) 2015 dugancathal. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    var name: String = "" {
        didSet {
            if name != oldValue {
                nameLabel.text = name
            }
        }
    }
    var color: String = "" {
        didSet {
            if color != oldValue {
                colorLabel.text = color
            }
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
