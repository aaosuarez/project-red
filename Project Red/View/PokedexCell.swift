//
//  PokedexCell.swift
//  Project Red
//
//  Created by Aaron Suarez on 1/25/20.
//  Copyright © 2020 Aaron Suarez. All rights reserved.
//

import UIKit

class PokedexCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
