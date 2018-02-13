//
//  MoviesViewController.swift
//  Flix
//
//  Created by Samuel Carbone on 1/14/18.
//  Copyright © 2018 Samuel Carbone. All rights reserved.
//

import UIKit
import AlamofireImage
class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies:[Movie] = []
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moviesTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieEntryCell", for: indexPath) as! MovieEntryCell
        cell.movie = movies[indexPath.row]
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIColor.white
        moviesTable.delegate = self
        moviesTable.dataSource = self
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(MoviesViewController.didPullToRefresh(_:)), for: .valueChanged)
        moviesTable.insertSubview(refreshControl, at: 0)
        activityIndicator.startAnimating()
        fetchNowPlaying()
    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchNowPlaying()
    }
    func fetchNowPlaying(){
        self.activityIndicator.startAnimating()
        MovieApiManager().popularMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.moviesTable.reloadData()
            }
            self.refreshControl.endRefreshing()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = moviesTable.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
