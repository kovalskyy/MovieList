//
//  MoviesService.swift
//  Movies
//
//  Created by Kacper Kowalski on 18.10.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import Foundation


class Movies {
    
    private var title: String
    private var overView: String
    private var releaseDate: String
    private var voteCount: NSNumber?
    private var posterPath: String?
    
//MARK: Getters
    
    private static var movieList = [Movies]()
    
//MARK: Constructor
    
    init(title: String, overView: String, releaseDate: String, voteCount: NSNumber, posterPath: String?) {
        
        self.title = title
        self.overView = overView
        self.releaseDate = releaseDate
        self.voteCount = voteCount
        self.posterPath = posterPath
    }
    
    static let APIKey = "80e25c5cf03b58abdaa9b93d556f1168"
    static let endPoint = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    
    typealias MoviesNowPlayingCompletionHandler = () -> ()
    
    class func downloadMovieList(_ completed: @escaping MoviesNowPlayingCompletionHandler) {
        
        let url = URL(string: Movies.endPoint + Movies.APIKey)
        
    }
} 
