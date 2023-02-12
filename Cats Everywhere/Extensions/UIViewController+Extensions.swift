//
//  UIViewController+Extensions.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import UIKit

extension UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var coordinator: AppCoordinator {
        return self.appDelegate.coordinator
    }
}
