//
//  LaunchView.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/19.
//

import UIKit

class LaunchView: UIView {
    //MARK: - Properties
    var titleImgView: UIImageView = {
        var imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = #imageLiteral(resourceName: "cat")
        imgView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imgView
    }()
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.text = "고양이 사진 수집기"
        label.sizeToFit()
        return label
    }()
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - 초기 UI
    func configureUI() {
        backgroundColor = .systemIndigo
        addSubview(titleImgView)
        titleImgView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleImgView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
