//
//  SingleEpisodeModel.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 23.08.23.
//

import Foundation

struct SingleEpisodeModel: Decodable {
  let name: String
  private let air_date: String
  let episode: String
  var date: String {
    return air_date
  }
  
}
