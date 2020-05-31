//
//  PokemonTableViewCell.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokename: UILabel!
    @IBOutlet weak var poketype: UILabel!
    @IBOutlet weak var pokepoints: UILabel!
    @IBOutlet weak var pokeimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

