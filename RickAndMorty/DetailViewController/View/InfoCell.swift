//
//  InfoCell.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 22.08.23.
//

import Foundation
import UIKit

// MARK: - InfoCell
class InfoCell: UITableViewCell {
  
  // MARK: - Properties
  lazy var speciesLabel: UILabel = {
    let speciesLabel = UILabel()
    speciesLabel.textAlignment = .left
    speciesLabel.textColor = UIColor.white
    speciesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    speciesLabel.numberOfLines = 0
    speciesLabel.text = "Species:"
    return speciesLabel
  }()
  
  lazy var typeLabel: UILabel = {
    let typeLabel = UILabel()
    typeLabel.textAlignment = .left
    typeLabel.textColor = UIColor.white
    typeLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    typeLabel.numberOfLines = 1
    typeLabel.text = "Type:"
    return typeLabel
  }()
  
  lazy var genderLabel: UILabel = {
    let genderLabel = UILabel()
    genderLabel.textAlignment = .left
    genderLabel.textColor = UIColor.white
    genderLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    genderLabel.numberOfLines = 0
    genderLabel.text = "Gender:"
    return genderLabel
  }()
  
  // MARK: - Properties
  lazy var dynamicSpeciesLabel: UILabel = {
    let speciesLabel = UILabel()
    speciesLabel.textAlignment = .right
    speciesLabel.textColor = UIColor.white
    speciesLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    speciesLabel.numberOfLines = 0
    speciesLabel.text = "Human"
    return speciesLabel
  }()
  
  lazy var dynamicTypeLabel: UILabel = {
    let typeLabel = UILabel()
    typeLabel.textAlignment = .right
    typeLabel.textColor = UIColor.white
    typeLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    typeLabel.numberOfLines = 0
    typeLabel.minimumScaleFactor = 12
    typeLabel.text = "None"
    return typeLabel
  }()
  
  lazy var dynamicGenderLabel: UILabel = {
    let genderLabel = UILabel()
    genderLabel.textAlignment = .right
    genderLabel.textColor = UIColor.white
    genderLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    genderLabel.numberOfLines = 0
    genderLabel.text = "Male"
    return genderLabel
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
    addSubviews()
    setupLayout()
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
    addSubview(speciesLabel)
    addSubview(typeLabel)
    addSubview(genderLabel)
    addSubview(dynamicSpeciesLabel)
    addSubview(dynamicTypeLabel)
    addSubview(dynamicGenderLabel)
    
  }
  
  private func setupLayout() {
    speciesLabel.translatesAutoresizingMaskIntoConstraints = false
    typeLabel.translatesAutoresizingMaskIntoConstraints = false
    genderLabel.translatesAutoresizingMaskIntoConstraints = false
    dynamicSpeciesLabel.translatesAutoresizingMaskIntoConstraints = false
    dynamicTypeLabel.translatesAutoresizingMaskIntoConstraints = false
    dynamicGenderLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
     
      speciesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      speciesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      
      dynamicSpeciesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      dynamicSpeciesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 16),
      typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      typeLabel.widthAnchor.constraint(equalToConstant: 50),
      
      dynamicTypeLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 5),
      dynamicTypeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 16),
      dynamicTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16),
      genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      
      dynamicGenderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16),
      dynamicGenderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
    ])
  }
  
}
