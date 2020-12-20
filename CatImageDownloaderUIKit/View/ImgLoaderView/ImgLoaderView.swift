//
//  ImgLoaderView.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import UIKit

class ImgLoaderView: UIView {
    //MARK: - Properties
    var imgView: UIImageView = {
        var imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imgView.layer.cornerRadius = 10
        imgView.layer.borderWidth = 1
        imgView.backgroundColor = .gray
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.clipsToBounds = true
        return imgView
    }()
    var catNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 500).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    var catLifeExpectLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 500).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    var progressBar: UIProgressView = {
        var progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.widthAnchor.constraint(equalToConstant: 200).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
        progressBar.progressTintColor = .link
        return progressBar
    }()
    var progressLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var downloadButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemIndigo
        button.setTitle("고양이 사진 받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "square.and.arrow.down")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    var imgSaveButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        button.setTitle("저장", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "photo")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - 초기 UI 작업
    func initialUI() {
        backgroundColor = #colorLiteral(red: 0.1889419258, green: 0.1871659458, blue: 0.2520412803, alpha: 1)
        
        //다운로드 받은 이미지가 들어갈 이미지 뷰.
        addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imgView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    
        //현재 다운로드 상황을 표시할 프로그레스 바
        addSubview(progressBar)
        progressBar.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //고양이 이름 라벨
        addSubview(catNameLabel)
        catNameLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20).isActive = true
        catNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //고양이 수명 라벨
        addSubview(catLifeExpectLabel)
        catLifeExpectLabel.topAnchor.constraint(equalTo: catNameLabel.bottomAnchor, constant: 5).isActive = true
        catLifeExpectLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //현재 다운로드 받은 바이트와 전체 바이트 표시
        addSubview(progressLabel)
        progressLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 5).isActive = true
        progressLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    
        //다운로드 버튼
        addSubview(downloadButton)
        downloadButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        downloadButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //이미지 저장 버튼
        addSubview(imgSaveButton)
        imgSaveButton.bottomAnchor.constraint(equalTo: downloadButton.topAnchor, constant: -20).isActive = true
        imgSaveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        imgSaveButton.isHidden = true
        imgSaveButton.isUserInteractionEnabled = false
    }
}
