//
//  OriginCell.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 22.08.23.
//

import Foundation
import UIKit

// MARK: - OriginCell
class OriginCell: UITableViewCell {
  
  // MARK: - Properties
  let viewImage: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 10
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.129534781, green: 0.1488536894, blue: 0.2179681659, alpha: 1)
    return view
  }()
  
  let imagePlanetView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Planet")
    return imageView
  }()
  
  lazy var nameLocationLabel: UILabel = {
    let speciesLabel = UILabel()
    speciesLabel.textAlignment = .left
    speciesLabel.textColor = UIColor.white
    speciesLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    speciesLabel.numberOfLines = 0
    speciesLabel.text = "Earth"
    return speciesLabel
  }()
  
  lazy var typeLocationLabel: UILabel = {
    let typeLabel = UILabel()
    typeLabel.textAlignment = .left
    typeLabel.textColor = #colorLiteral(red: 0.3242220879, green: 0.7996779084, blue: 0.03119211644, alpha: 1)
    typeLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    typeLabel.numberOfLines = 1
    typeLabel.text = "Planet"
    return typeLabel
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
    addSubview(viewImage)
    viewImage.addSubview(imagePlanetView)
    addSubview(nameLocationLabel)
    addSubview(typeLocationLabel)
    
  }
  
  private func setupLayout() {
    viewImage.translatesAutoresizingMaskIntoConstraints = false
    imagePlanetView.translatesAutoresizingMaskIntoConstraints = false
    nameLocationLabel.translatesAutoresizingMaskIntoConstraints = false
    typeLocationLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      viewImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      viewImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      viewImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
      viewImage.widthAnchor.constraint(equalToConstant: 40),
      viewImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      
      imagePlanetView.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor),
      imagePlanetView.centerYAnchor.constraint(equalTo: viewImage.centerYAnchor),
      imagePlanetView.heightAnchor.constraint(equalToConstant: 20),
      imagePlanetView.widthAnchor.constraint(equalToConstant: 20),
      
      nameLocationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      nameLocationLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 16),
      nameLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      
      typeLocationLabel.topAnchor.constraint(equalTo: nameLocationLabel.bottomAnchor, constant: 8),
      typeLocationLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 16),
      typeLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      typeLocationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      
      
      
    ])
  }
  
}
