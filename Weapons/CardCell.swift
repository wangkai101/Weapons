//
//  CardCell.swift
//  Weapons
//
//  Created by Mr wngkai on 2018/6/8.
//  Copyright © 2018年 Mr wngkai. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var originLable: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var weaponLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    var favourite = false {
        willSet {
            if newValue {
                favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
            } else {
                favBtn.setImage(#imageLiteral(resourceName: "unfav"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
