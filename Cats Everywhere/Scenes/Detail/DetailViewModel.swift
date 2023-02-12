//
//  DetailViewModel.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 10/02/23.
//

import UIKit
import Kingfisher

class DetailViewModel {
    
    var imageObject: ImageObject?
    
    init(imageObject: ImageObject) {
        self.imageObject = imageObject
    }
    
    func setup(with viewModel: Image, imageView: UIImageView) -> ImageResource? {
        guard let url = URL(string: viewModel.link ?? "") else { return nil }
        let resource = ImageResource(downloadURL: url)
        return resource
    }
}
