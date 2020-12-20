//
//  LaunchHelperForNav.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/19.
//

import UIKit

extension LaunchController {
    func setNavBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    func goToImgLoadView() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(ImgLoadController(), animated: false)
    }
}
