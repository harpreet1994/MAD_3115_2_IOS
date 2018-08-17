//
//  TableViewCell.swift
//  Summer18Midterm
//
//  Created by Jigisha Patel on 2018-08-11.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblResult: UILabel!
    
    @IBOutlet var imgResult: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
