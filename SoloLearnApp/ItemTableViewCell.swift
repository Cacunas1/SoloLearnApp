//
//  ItemTableViewCell.swift
//  SoloLearnApp
//
//  Created by Cristian Acuña on 11-07-17.
//  Copyright © 2017 Nihilism Incorporated. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBOutlet weak var nameLabel: UILabel!
	
}
