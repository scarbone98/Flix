//
//  MovieEntryCell.swift
//  Flix
//
//  Created by Samuel Carbone on 1/14/18.
//  Copyright © 2018 Samuel Carbone. All rights reserved.
//

import UIKit

class MovieEntryCell: UITableViewCell {
    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
