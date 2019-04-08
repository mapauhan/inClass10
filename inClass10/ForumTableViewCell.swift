//
//  ForumTableViewCell.swift
//  inClass10
//
//  Created by Maria Handschu on 4/7/19.
//  Copyright © 2019 Handschu, Maria. All rights reserved.
//

import UIKit

class ForumTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var multiTextLabel: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    //icons
    @IBOutlet weak var trashIcon: UIImageView!
    @IBOutlet weak var heartIcon: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
    }

