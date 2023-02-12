//
//  MainView.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import UIKit

class MainView: UIView {
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MainImageCollectionViewCell.self, forCellWithReuseIdentifier: MainImageCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        view.setCollectionViewLayout(layout, animated: false)
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView: RenderViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func additionalViewSetup() {
        backgroundColor = .systemBackground
    }
}
