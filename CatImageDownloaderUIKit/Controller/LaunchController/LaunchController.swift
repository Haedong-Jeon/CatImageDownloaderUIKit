//
//  ViewController.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/19.
//
import UIKit
class LaunchController: UIViewController {
    //MARK: - Properties
    //뷰들
    let launchView = LaunchView()
    //MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToImgLoadView()
        }
    }
}

