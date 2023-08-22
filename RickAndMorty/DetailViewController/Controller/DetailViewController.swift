//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 21.08.23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - NetworkService
  let networkService = NetworkService.shared
  
  // MARK: - SingleModel
  var model: SingleCharacterModel?
  var locationModel: SingleLocationModel?
  var id = 1
  
  // MARK: - Private Property
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
    characterName.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    characterName.numberOfLines = 0
    characterName.text = ""
    return characterName
  }()
  
  lazy var characterStatus: UILabel = {
    let characterName = UILabel()
    characterName.textAlignment = .center
    characterName.textColor = #colorLiteral(red: 0.3242220879, green: 0.7996779084, blue: 0.03119211644, alpha: 1)
    characterName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    characterName.numberOfLines = 0
    return characterName
  }()
  
  let tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.backgroundColor = #colorLiteral(red: 0.01194443181, green: 0.05684185773, blue: 0.1571785212, alpha: 1)
    return tableView
  }()
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    networkService.getSingleCharacterWith(id: id) { [weak self] character in
      if let self = self {
        self.model = character
        self.updateCharacterPhoto()
        DispatchQueue.main.async {
          self.characterName.text = self.model?.name
          self.characterStatus.text = self.model?.status
          
        }
      }
    }
    
    networkService.getLocationWith(id: id) { [weak self] location in
      if let self = self {
        self.locationModel = location
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
        
      }
    }
  }
  
  // MARK: - Actions Methods
  @objc
  func backButtonTapped() {
    navigationController?.popViewController(animated: true)
  }
  
}

// MARK: - Setting Views
private extension DetailViewController {
  func setupView() {
    configureSuperview()
    addSubviews()
    setupLayout()
    configureNavController()
    configureTableView()
    
  }
  
  func configureSuperview() {
    view.backgroundColor = #colorLiteral(red: 0.01194443181, green: 0.05684185773, blue: 0.1571785212, alpha: 1)
  }
}

// MARK: - Setting
private extension DetailViewController {
  func addSubviews() {
    view.addSubview(characterPhoto)
    view.addSubview(characterName)
    view.addSubview(characterStatus)
    view.addSubview(tableView)
  }
  
  func configureNavController() {
    title = ""
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationController?.hidesBarsOnSwipe = false
    let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtonTapped))
    leftBarButtonItem.tintColor = .white
    navigationItem.leftBarButtonItem = leftBarButtonItem
  }
  
  func updateCharacterPhoto() {
    guard let model = model else { return }
    networkService.getImage(url: model.image) { [weak self] data in
      guard let data = data else { return }
      
      DispatchQueue.main.async {
        self?.characterPhoto.image = UIImage(data: data)
      }
      
    }
  }
  
  func configureTableView() {
    tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
    tableView.register(OriginCell.self, forCellReuseIdentifier: "OriginCell")
    tableView.register(EpisodeCell.self, forCellReuseIdentifier: "EpisodeCell")
    tableView.delegate = self
    tableView.dataSource = self
  }
}

// MARK: - Layout
private extension DetailViewController {
  func setupLayout() {
    characterPhoto.translatesAutoresizingMaskIntoConstraints = false
    characterName.translatesAutoresizingMaskIntoConstraints = false
    characterStatus.translatesAutoresizingMaskIntoConstraints = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      characterPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      characterPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      characterPhoto.heightAnchor.constraint(equalToConstant: 150),
      characterPhoto.widthAnchor.constraint(equalToConstant: 150),
      
      characterName.topAnchor.constraint(equalTo: characterPhoto.bottomAnchor, constant: 24),
      characterName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
      characterStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      tableView.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 20),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
    ])
  }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
 
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 1
    case 2:
      return model?.episode.count ?? 1
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let label = UILabel()
    label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    
    switch section {
    case 0:
      label.text = "Info"
      return label
    case 1:
      label.text = "Origin"
      return label
    case 2:
      label.text = "Episodes"
      return label
    default:
      return label
    }
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let model = model else { return UITableViewCell() }
    guard let locationModel = locationModel else { return UITableViewCell() }
    switch indexPath.section {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell else { return UITableViewCell() }
      cell.dynamicSpeciesLabel.text = model.species
      if model.type != "" {
        cell.dynamicTypeLabel.text = model.type
      }
      cell.dynamicGenderLabel.text = model.gender
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "OriginCell", for: indexPath) as? OriginCell else { return UITableViewCell() }
      cell.nameLocationLabel.text = locationModel.name
      cell.typeLocationLabel.text = locationModel.type
      return cell
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeCell else { return UITableViewCell() }
      networkService.singleEpisode(url: model.episode[indexPath.row]) { singleEpisode in
        
        DispatchQueue.main.async {
          cell.episodeName.text = singleEpisode.name
          cell.episodeSeasonName.text = singleEpisode.episode
          cell.dateName.text = singleEpisode.date
        }
      
      }
      return cell
    default:
      return UITableViewCell()
    }
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  
}
