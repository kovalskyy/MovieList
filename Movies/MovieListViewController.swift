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
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //
//        return 1
//    }
    
    
    
    
    
    
    

}

