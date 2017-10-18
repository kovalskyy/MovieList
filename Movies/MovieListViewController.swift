//
//  MovieListViewController.swift
//  Movies
//
//  Created by Kacper Kowalski on 18.10.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListViewController: UITableViewController {

    static let cellIdentifier = "cellID"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "MOVIE LIST"
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieListViewController.cellIdentifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //
        Movies.downloadMovieList {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListViewController.cellIdentifier, for: indexPath) as? MovieCell else {
            fatalError()
        }
        
        let movie = Movies.movieList[indexPath.row]
        
        // this path is provided by API docs.
        let imagePath = "https://image.tmdb.org/t/p/w342" + movie.posterPath!
        let url = URL(string: String(imagePath))
        cell.movieImageView.kf.setImage(with: url)
        
        cell.movieTitleLabel.text = movie.title.uppercased()
        cell.dateLabel.text = "Release Date: " + movie.releaseDate
        cell.descriptionLabel.text = movie.overView
        if let voteCount = movie.voteCount {
            cell.reviewsCountLabel.text = "Number of Reviews \(voteCount)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movies.movieList.count
    }
    
}
