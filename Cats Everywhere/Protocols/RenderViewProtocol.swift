//
//  RenderViewProtocol.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import Foundation

protocol RenderViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalViewSetup()
}

extension RenderViewProtocol {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        additionalViewSetup()
    }
}
