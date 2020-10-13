//
//  MacroCell.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 5/14/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import UIKit

class MacroCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImage.backgroundColor = .lightGray
        iconImage.layer.cornerRadius = Constants.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
