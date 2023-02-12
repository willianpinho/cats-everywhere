//
//  MainViewModel.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import UIKit

class MainViewModel {
    
    private var service = SearchService()
    var dataFound: (() -> ())?
    var images: [ImageObject] = []
    
    init() {}
    
    func getSearchCats() {
        service.getSearchCats { [weak self] result in
            switch result {
            case .success(let images):
                var imagesNotNull: [ImageObject] = []
                for image in images {
                    if let _ = image.images.first?.link {
                        imagesNotNull.append(image)
                    }
                }
                self?.images = imagesNotNull
                self?.dataFound?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
