//
//  APICaller.swift
//  NetflixClone
//
//  Created by naseem on 23/02/2022.
//

import Foundation

struct Endpoint {
  static let API_KEY =  "d9a29091441a054435c322a9bacabaa2"
  static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
  case failedToGetData
}

class APICaller {
  static let shared = APICaller()
  
  func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/trending/all/day?api_key=\(Endpoint.API_KEY)") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
      
      
    }
    task.resume()
  }
}
