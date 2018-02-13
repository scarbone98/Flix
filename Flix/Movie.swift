//
//  Movie.swift
//  Flix
//
//  Created by Samuel Carbone on 2/12/18.
//  Copyright © 2018 Samuel Carbone. All rights reserved.
//

import Foundation
class Movie {
    var title: String
    var posterUrl: String?
    var releaseDate: String
    var overview: String
    var backdropPathString: String?
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        releaseDate = dictionary["release_date"] as? String ?? "No date"
        overview = dictionary["overview"] as? String ?? "No Overview"
        backdropPathString = dictionary["backdrop_path"] as? String
        posterUrl = dictionary["poster_path"] as? String
    }
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}

