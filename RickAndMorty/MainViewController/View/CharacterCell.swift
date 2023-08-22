//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 21.08.23.
//

import Foundation
import UIKit

// MARK: - CategoryCell
class CategoryCell: UICollectionViewCell {
  
  // MARK: - Static Properties
  static let reuseIdentifier = "CategoryCell"
  
  // MARK: - Properties
  lazy var characterPhoto: UIImageView = {
    let characterPhoto = UIImageView()
    characterPhoto.layer.cornerRadius = 10
    characterPhoto.clipsToBounds = true
    characterPhoto.contentMode = .scaleAspectFill
    return characterPhoto
  }()
  
  lazy var characterName: UILabel = {
    let characterName = UILabel()
    characterName.textAlignment = .center
    characterName.textColor = UIColor.white
    characterName.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    characterName.numberOfLines = 0
    return characterName
  }()
  
  lazy var loading: UIActivityIndicatorView = {
    let loading = UIActivityIndicatorView()
    return loading
  }()
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCell()
    addSubviews()
    setupLayout()
  }
  
  func startAnimation() {
    loading.startAnimating()
  }
  
  func stopAnimation() {
    loading.stopAnimating()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  private func setupCell() {
    backgroundColor = #colorLiteral(red: 0.1976234317, green: 0.219899714, blue: 0.2836517096, alpha: 1)
    layer.cornerRadius = 10
  }
  
  private func addSubviews() {
    addSubview(characterPhoto)
    addSubview(characterName)
    characterPhoto.addSubview(loading)
  }
  
  private func setupLayout() {
    characterPhoto.translatesAutoresizingMaskIntoConstraints = false
    characterName.translatesAutoresizingMaskIntoConstraints = false
    loading.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      characterPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      characterPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
      characterPhoto.widthAnchor.constraint(equalToConstant: 140),
      characterPhoto.heightAnchor.constraint(equalToConstant: 140),
      
      characterName.topAnchor.constraint(equalTo: characterPhoto.bottomAnchor, constant: 12),
      characterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      characterName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
      
      loading.centerXAnchor.constraint(equalTo: characterPhoto.centerXAnchor),
      loading.centerYAnchor.constraint(equalTo: characterPhoto.centerYAnchor),
      
    ])
  }
}
