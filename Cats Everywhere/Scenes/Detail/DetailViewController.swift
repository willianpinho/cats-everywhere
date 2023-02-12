//
//  DetailViewController.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 10/02/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var scene = DetailView()
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
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
        setupNavigationBar()
        setupViewModel()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.isOpaque = true
        self.title = viewModel.imageObject?.title
    }
    
    private func setupViewModel() {
        guard let currentImage = viewModel.imageObject?.images.first else { return }
        scene.imageView.kf.setImage(with: viewModel.setup(with: currentImage, imageView: scene.imageView), placeholder: UIImage(named: "error_image"), options: nil, progressBlock: nil, completionHandler: { result in
            switch result {
            case .success(let imageResult):
                print(imageResult)
            case .failure(_):
                self.showAlertImageIsVideo()
            }
        })
    }
    
    func showAlertImageIsVideo() {
        let alert = UIAlertController(title: "Error", message: "Image is a video, sorry for not present", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
