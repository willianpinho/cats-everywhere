//
//  AppCoordinator.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import UIKit

class AppCoordinator {
    
    private var presenter: UINavigationController
    private var window: UIWindow
    private weak var appDelegate: AppDelegate?
    
    init(appDelegate: AppDelegate, window: UIWindow) {
        self.appDelegate = appDelegate
        self.window = window
        self.presenter = UINavigationController()
    }
    
    func start() {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: mainViewModel)
        self.presenter = UINavigationController(rootViewController: mainViewController)
        self.appDelegate?.window = self.window
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
    
    func mainToDetail(imageObject: ImageObject) {
        let viewModel = DetailViewModel(imageObject: imageObject)
        let detailVC = DetailViewController(viewModel: viewModel)
        presenter.pushViewController(detailVC, animated: true)
    }
    
}
