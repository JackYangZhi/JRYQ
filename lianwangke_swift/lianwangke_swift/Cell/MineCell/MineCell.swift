//
//  MineCell.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/8.
//  Copyright © 2016年 杨星. All rights reserved.
//

import UIKit

class MineCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var acceImageView: UIImageView!

    @IBOutlet weak var exitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
