//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 21.08.23.
//

import Foundation

struct AllCharacterModel: Decodable {
  
  let results: [Results]
}

struct Results: Decodable {
  let name: String
  let id: Int
  let image: String
}
