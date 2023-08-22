//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Андрей Фроленков on 17.08.23.
//

import UIKit
// MARK: - MainViewController
class MainViewController: UIViewController {
  
  // MARK: - NetworkService
  let networkService = NetworkService.shared
  // MARK: - Model
  var character: AllCharacterModel?
  
  // MARK: - Private Property
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
//    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    
    networkService.getJson(completion: { characterModel in
      self.character = characterModel
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    })
    
  }
  
}

// MARK: - Setting Views
private extension MainViewController {
  func setupView() {
    configureSuperview()
    configreNavBar()
    configureCollectionView()
    addSubviews()
    setupLayout()
    
    
  }
  
  func configureSuperview() {
    view.backgroundColor = #colorLiteral(red: 0.01194443181, green: 0.05684185773, blue: 0.1571785212, alpha: 1)
  }
}

// MARK: - Setting
private extension MainViewController {
  func addSubviews() {
    view.addSubview(collectionView)
  }
  
  func configreNavBar() {
    title = "Characters"
    
    let appearance = UINavigationBarAppearance()
    appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
    ]
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    appearance.backgroundColor = #colorLiteral(red: 0.01194443181, green: 0.05684185773, blue: 0.1571785212, alpha: 1)
    
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.isNavigationBarHidden = false
    navigationController?.hidesBarsOnSwipe = false
  }
  
  func configureCollectionView() {
    collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

// MARK: - Layout
private extension MainViewController {
  func setupLayout() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return character?.results.count ?? 0
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
  
    cell.startAnimation()
    networkService.getImage(url: character?.results[indexPath.row].image ?? "") { data in
      if let data = data {
        let image = UIImage(data: data)
        DispatchQueue.main.async {
          cell.characterPhoto.image = image
          cell.stopAnimation()
        }
      }
    }
    
    cell.characterName.text = character?.results[indexPath.row].name
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailViewController = DetailViewController()
    detailViewController.modalPresentationStyle = .fullScreen
    detailViewController.id = character?.results[indexPath.row].id ?? 1
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }

  
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemsPerRow: CGFloat = 2
    let paddingWidth = 20 * (itemsPerRow + 1)
    let availableWidth = collectionView.frame.width - paddingWidth
    let widthPerItem = availableWidth / itemsPerRow
    let height = widthPerItem + 50
    return CGSize(width: widthPerItem, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}

