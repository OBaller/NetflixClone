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
  static let youtubeAPI_KEY = "AIzaSyCYyM61pd-4zYdTT_DdTWmgkktc0NR6T5Q"
  static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
  case failedToGetData
}

class APICaller {
  static let shared = APICaller()
  
  func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/trending/movie/day?api_key=\(Endpoint.API_KEY)") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/trending/tv/day?api_key=\(Endpoint.API_KEY)") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/movie/upcoming?api_key=\(Endpoint.API_KEY)&language=en-US&page=1") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/movie/popular?api_key=\(Endpoint.API_KEY)&language=en-US&page=1") else { return }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/movie/top_rated?api_key=\(Endpoint.API_KEY)&language=en-US&page=1") else { return }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  // https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
  
  func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Endpoint.baseURL)/3/discover/movie?api_key=\(Endpoint.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
    
    guard let url = URL(string: "\(Endpoint.baseURL)/3/search/movie?api_key=\(Endpoint.API_KEY)&query=\(query)") else { return }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
    guard let url = URL(string: "\(Endpoint.youtubeBaseURL)q=\(query)&key=\(Endpoint.youtubeAPI_KEY)") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
        completion(.success(results.items[0]))
      } catch {
        completion(.failure(error))
        print(error.localizedDescription)
        
      }
    }
    task.resume()
  }
  
}
