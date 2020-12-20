//
//  ImgLoadHelperForViews.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import UIKit

extension ImgLoadController {
    func setViews() {
        view.addSubview(imgLoadView)
        imgLoadView.translatesAutoresizingMaskIntoConstraints = false
        imgLoadView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        imgLoadView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
    }
    func addFunctionForButtons() {
        imgLoadView.downloadButton.addTarget(self, action: #selector(imgDownButtonTouched), for: .touchUpInside)
        imgLoadView.imgSaveButton.addTarget(self, action: #selector(imgSaveButtonTouched), for: .touchUpInside)
    }
}
