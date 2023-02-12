//
//  MainImageCollectionViewCell.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import UIKit
import Kingfisher

class MainImageCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        return imageView
    } ()
    
    static let identifier = "MainImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setup(with image: Image, myCompletionHandler: @escaping ((UIImage)->())) {
        guard let url = URL(string: image.link ?? "") else { return }
        let resource = ImageResource(downloadURL: url)
        imageView.kf.setImage(with: resource, placeholder: UIImage(named: "error_image"), options: nil, progressBlock: nil, completionHandler: { result in
            switch result {
            case .success(let imageResult):
                myCompletionHandler(imageResult.image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
