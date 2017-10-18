//
//  MoviesService.swift
//  Movies
//
//  Created by Kacper Kowalski on 18.10.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import Foundation
import Alamofire

var request: Alamofire.Request?

struct Movies {
     var title: String
     var overView: String
     var releaseDate: String
     var voteCount: NSNumber?
     var posterPath: String?
    
    static var movieList = [Movies]()
    
    static let APIKey = "80e25c5cf03b58abdaa9b93d556f1168"
    static let endPoint = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    
    typealias MoviesNowPlayingCompletionHandler = () -> ()
    
    static func downloadMovieList(_ completed: @escaping MoviesNowPlayingCompletionHandler) {
        
        var movies = [Movies]()
        
        let url = URL(string: Movies.endPoint + Movies.APIKey)!
        
        request = Alamofire.request(url).responseJSON { response in
            debugPrint(response)
            
            DispatchQueue.global().async {
                if let json = response.result.value {
                    
                    if let result = response.result.value as? Dictionary <String, AnyObject> {
                        if let list  = result["results"] as? [Dictionary<String, AnyObject>] {
                            for obj in list {
                                guard let title = obj["title"] else { return }
                                guard let overview = obj["overview"] else { return }
                                guard let releaseDate = obj["release_date"] else { return }
                                guard let voteCount = obj["vote_count"] else { return }
                                guard let posterPath = obj["poster_path"] else { return }
                                
                                movies.append(Movies(title: title as! String, overView: overview as! String, releaseDate: releaseDate as! String, voteCount: voteCount as! NSNumber, posterPath: posterPath as! String))
                                self.movieList = movies
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                
            }
            
        }
    }
}
