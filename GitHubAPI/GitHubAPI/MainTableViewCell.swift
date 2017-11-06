//
//  MainTableViewCell.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelForksStars: UILabel!
    
    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var labelNameUser: UILabel!
    @IBOutlet weak var labelFullNameUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}