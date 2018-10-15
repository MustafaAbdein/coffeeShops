//
//  VenueCell.swift
//  drinkCoffe
//
//  Created by Mostafa on 10/8/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var addressLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
