//
//  File.swift
//  Flix
//
//  Created by Samuel Carbone on 2/12/18.
//  Copyright © 2018 Samuel Carbone. All rights reserved.
//

import Foundation

class Movie{
    var title: String
    var posterUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        poster = URL(string: dictionary["poster_path"] as? String)
        
    }
}
