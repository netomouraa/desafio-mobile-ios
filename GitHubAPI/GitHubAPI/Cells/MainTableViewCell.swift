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
    @IBOutlet weak var labelForks: UILabel!
    @IBOutlet weak var labelStars: UILabel!

    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var labelNameUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
