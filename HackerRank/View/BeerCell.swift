//
//  BeerCell.swift
//  HackerRank
//
//  Created by Ramiro Lima Vale Neto on 08/05/19.
//  Copyright © 2019 saadeloulladi. All rights reserved.
//

import UIKit
import SDWebImage

class BeerCell: UITableViewCell {
    @IBOutlet  weak var beerImage: SDAnimatedImageView!
    @IBOutlet  weak var beerName: UILabel!
    @IBOutlet  weak var beerAlcoholContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
