//
//  DetailViewController.swift
//  Flix
//
//  Created by Samuel Carbone on 1/20/18.
//  Copyright © 2018 Samuel Carbone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            if let movieBackDrop = movie.backdropPathString{
                let backdropPathString = movieBackDrop
                let backdropURL = URL(string:"https://image.tmdb.org/t/p/w500/" + backdropPathString)!
                backDropImageView.af_setImage(withURL: backdropURL)
            }
            if let posterUrl = movie.posterUrl{
                let posterPath = posterUrl
                let posterURL = URL(string:"https://image.tmdb.org/t/p/w500/" + posterPath)!
                posterImageView.af_setImage(withURL: posterURL)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
