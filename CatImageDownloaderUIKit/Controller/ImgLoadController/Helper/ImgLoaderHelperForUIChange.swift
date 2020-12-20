//
//  ImgLoaderHelperForUIChange.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import UIKit

extension ImgLoadController {
    func changeButtonUI() {
        if isDownloading {
            imgLoadView.downloadButton.backgroundColor = .systemPink
            imgLoadView.downloadButton.setTitle("불러오는 중", for: .normal)
            imgLoadView.downloadButton.setImage(UIImage(systemName: "antenna.radiowaves.left.and.right")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)

            imgLoadView.downloadButton.setTitleColor(.white, for: .normal)
            imgLoadView.downloadButton.isUserInteractionEnabled = false
            
            self.imgLoadView.imgSaveButton.isHidden = true
            self.imgLoadView.imgSaveButton.isUserInteractionEnabled = false
        } else {
            imgLoadView.downloadButton.backgroundColor = .systemIndigo
            imgLoadView.downloadButton.setTitle("고양이 사진 받기", for: .normal)
            imgLoadView.downloadButton.setImage(UIImage(systemName: "square.and.arrow.down")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
            imgLoadView.downloadButton.setTitleColor(.white, for: .normal)
            imgLoadView.downloadButton.isUserInteractionEnabled = true
            
            self.imgLoadView.imgSaveButton.isHidden = false
            self.imgLoadView.imgSaveButton.isUserInteractionEnabled = true
        }
    }
}
