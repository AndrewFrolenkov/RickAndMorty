//
//  EpisodesCell.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 23.08.23.
//

import Foundation
import UIKit

// MARK: - EpisodesCell
class EpisodeCell: UITableViewCell {
  
  // MARK: - Properties
  lazy var episodeName: UILabel = {
    let episodeName = UILabel()
    episodeName.textAlignment = .left
    episodeName.textColor = UIColor.white
    episodeName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    episodeName.numberOfLines = 0
    episodeName.text = "Name"
    return episodeName
  }()
  
  lazy var episodeSeasonName: UILabel = {
    let episodeSeasonName = UILabel()
    episodeSeasonName.textAlignment = .left
    episodeSeasonName.textColor = UIColor.white
    episodeSeasonName.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    episodeSeasonName.numberOfLines = 0
    episodeSeasonName.textColor = #colorLiteral(red: 0.3242220879, green: 0.7996779084, blue: 0.03119211644, alpha: 1)
    episodeSeasonName.text = "Name"
    return episodeSeasonName
  }()
  
  lazy var dateName: UILabel = {
    let episodeName = UILabel()
    episodeName.textAlignment = .left
    episodeName.textColor = #colorLiteral(red: 0.6425313354, green: 0.6608255506, blue: 0.6748523712, alpha: 1)
    episodeName.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    episodeName.numberOfLines = 0
    episodeName.text = "Date"
    return episodeName
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
    addSubview(episodeName)
    addSubview(episodeSeasonName)
    addSubview(dateName)
    
  }
  
  private func setupLayout() {
    episodeName.translatesAutoresizingMaskIntoConstraints = false
    episodeSeasonName.translatesAutoresizingMaskIntoConstraints = false
    dateName.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      episodeName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      episodeName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      episodeName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      episodeSeasonName.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 16),
      episodeSeasonName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      episodeSeasonName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      
      dateName.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 16),
      dateName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      dateName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
    ])
  }
}
