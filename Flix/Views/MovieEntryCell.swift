//
//  MovieEntryCell.swift
//  Flix
//
//  Created by Samuel Carbone on 1/14/18.
//  Copyright © 2018 Samuel Carbone. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieEntryCell: UITableViewCell {
    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    var movie: Movie! {
        didSet(myMovie){
            let moviePicture = movie.posterUrl
            let pictureURL = URL(string: "https://image.tmdb.org/t/p/w500/" + moviePicture!)
            movieOverview.text = movie.overview
            movieTitle.text = movie.title
            movieThumbnail.af_setImage(withURL: pictureURL!)
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
