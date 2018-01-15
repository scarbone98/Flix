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
    
    var movies:[[String: Any]] = []
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moviesTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieEntryCell", for: indexPath) as! MovieEntryCell
        let movie = movies[indexPath.row]
        let moviePicture = movie["poster_path"] as? String
        let pictureURL = URL(string: "https://image.tmdb.org/t/p/w150/" + moviePicture!)
        cell.movieOverview.text = movie["overview"] as? String
        cell.movieTitle.text = movie["title"] as? String
        cell.movieThumbnail.af_setImage(withURL: pictureURL!)
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
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=31b40f23458923f6846a18b020df4956")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        activityIndicator.startAnimating()
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: [])
                    as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.moviesTable.reloadData()
                self.refreshControl.endRefreshing()
            }
            self.activityIndicator.stopAnimating()
        }
        task.resume();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
