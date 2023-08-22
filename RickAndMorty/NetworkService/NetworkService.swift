//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 21.08.23.
//

import Foundation
import UIKit

final class NetworkService {
  
  static let shared = NetworkService()
  
  func getJson(completion: @escaping (AllCharacterModel) -> ()) {
    guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
    
    createSession(url: url) { data, response, error in
      guard let data = data else { return }
      
      do {
        let json = try JSONDecoder().decode(AllCharacterModel.self, from: data)
        completion(json)
      } catch {
        print(error)
      }
    }
  }
  
  func getImage(url: String, completion: @escaping (Data?) -> ()) {
    guard let url = URL(string: url) else { return }
    let session = URLSession.shared
    session.dataTask(with: url) { data, _, error in
      completion(data)
    }.resume()
  }
  
  func getSingleCharacterWith(id: Int, completion: @escaping (SingleCharacterModel)->()) {
    guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else { return }
    
    createSession(url: url) { data, response, error in
      guard let data = data else { return }
      
      do {
        let json = try JSONDecoder().decode(SingleCharacterModel.self, from: data)
        completion(json)
      } catch {
        print(error)
      }
    }
  }
  
  func getLocationWith(id: Int, completion: @escaping (SingleLocationModel)->()) {
    guard let url = URL(string: "https://rickandmortyapi.com/api/location/\(id)") else { return }
    
    createSession(url: url) { data, response, error in
      guard let data = data else { return }
      
      do {
        let json = try JSONDecoder().decode(SingleLocationModel.self, from: data)
        completion(json)
      } catch {
        print(error)
      }
    }
  }
  
  func singleEpisode(url: String, completion: @escaping (SingleEpisodeModel)->()) {
    guard let url = URL(string: url) else { return }
    createSession(url: url) { data, response, error in
      guard let data = data else { return }
      
      do {
        let json = try JSONDecoder().decode(SingleEpisodeModel.self, from: data)
        completion(json)
      } catch {
        print(error)
      }
    }
  }
  
  func createSession(url: URL, completion: @escaping (Data?, URLResponse?, Error?)->()) {
    let session = URLSession.shared
    session.dataTask(with: url) { data, response, error in
      completion(data, response, error)
    }.resume()
  }
}
