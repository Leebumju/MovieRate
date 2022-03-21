//
//  MovieModel.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/07.
//

import Foundation

protocol MovieModelProtocol {
    func moviesRetrieved(movies: [Movie])
}

class MovieModel {
    
    var delegate: MovieModelProtocol?
    
    func getMovies() {
        let urlString = "https://yts.lt/api/v2/list_movies.json"
        let url = URL(string: urlString)
        guard url != nil else {
            print("url이 없습니다")
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) {(data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    
                    let movieService = try decoder.decode(MovieResponse.self, from: data!)
                    DispatchQueue.main.async {
                        self.delegate?.moviesRetrieved(movies: movieService.data!.movies!)
                    }
                }
                catch {
                    print("error json")
                }
            }
        }
        datatask.resume()
    }
}
