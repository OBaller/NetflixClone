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
  
}
