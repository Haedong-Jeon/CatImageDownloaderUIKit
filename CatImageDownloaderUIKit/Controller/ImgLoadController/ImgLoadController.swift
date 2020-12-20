//
//  ImgLoadController.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import UIKit
import RxSwift
class ImgLoadController: UIViewController {
    //MARK: - Properties
    var disposeBag = DisposeBag()
    var imgLoadView = ImgLoaderView()
    var isDownloading = false
    var isFinished = false
    let byteFormatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useAll]
        return formatter
    }()
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        addFunctionForButtons()
    }
}
