//
//  LaunchHelperForUI.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/19.
//

import UIKit

extension LaunchController {
    func setViews() {
        launchView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(launchView)
        launchView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        launchView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}
