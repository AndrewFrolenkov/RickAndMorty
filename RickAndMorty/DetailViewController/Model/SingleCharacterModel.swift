//
//  SingleCharacterModel.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 22.08.23.
//

import Foundation

struct SingleCharacterModel: Decodable {
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String
  let location: Location
  let episode: [String]
  let image: String
}

struct Location: Decodable {
  let name: String
  let url: String
}
