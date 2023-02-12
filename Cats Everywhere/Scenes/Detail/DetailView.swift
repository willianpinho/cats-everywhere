//
//  DetailView.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 10/02/23.
//

import UIKit

class DetailView: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        return imageView
    } ()
    
    let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
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

extension DetailView: RenderViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(imageView)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
    
    func additionalViewSetup() {
        backgroundColor = .systemBackground
    }
}
