//
//  MainViewController.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var scene = MainView()
    var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = scene
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        viewModel.getSearchCats()
        viewModel.dataFound = { [weak self] in
            self?.refreshData()
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Cats IMGUR"
    }
    
    private func setupCollectionView() {
        scene.collectionView.delegate = self
        scene.collectionView.dataSource = self
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            self.scene.collectionView.reloadData()
        }
    }
    
    func reloadRows(indexPath: IndexPath) {
        scene.collectionView.reloadItems(at: [indexPath])
    }

}

//MARK: UITableViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator.mainToDetail(imageObject: viewModel.images[indexPath.row])
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//MARK: UITableViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainImageCollectionViewCell.identifier, for: indexPath) as! MainImageCollectionViewCell
        
        if let currentImage = viewModel.images[indexPath.row].images.first {
            cell.setup(with: currentImage) { image in
                self.reloadRows(indexPath: indexPath)
            }
        }
    
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
}
