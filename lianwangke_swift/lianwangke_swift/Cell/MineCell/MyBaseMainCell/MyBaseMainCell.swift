//
//  MyBaseMainCell.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/13.
//  Copyright © 2016年 杨星. All rights reserved.
//

import UIKit

class MyBaseMainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
