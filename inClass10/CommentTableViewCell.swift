//
//  CommentTableViewCell.swift
//  inClass10
//
//  Created by Maria Handschu on 4/8/19.
//  Copyright © 2019 Handschu, Maria. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func submitClicked(_ sender: UIButton) {
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
