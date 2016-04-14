//
//  CustomTableViewCell.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/11.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
