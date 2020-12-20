//
//  ImgLoadSelectorForDownButton.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import UIKit

extension ImgLoadController {
    @objc func imgDownButtonTouched() {
        //'받아오는 중'으로 버튼 UI 변경, 저장 버튼 비활성화
        isDownloading = true
        changeButtonUI()
        self.imgLoadView.catNameLabel.text = ""
        self.imgLoadView.catLifeExpectLabel.text = ""
        Networking.shared.loadCatImg()
        var total: Int64 = 0
        Networking.shared.total$.subscribe(onNext: {total = $0}).disposed(by: self.disposeBag)
        Networking.shared.written$.subscribe(onNext: { written in
            DispatchQueue.main.async {
                let totalBytes = self.byteFormatter.string(fromByteCount: total)
                let writtenBytes = self.byteFormatter.string(fromByteCount: written)
                
                self.imgLoadView.progressLabel.text = "\(writtenBytes) / \(totalBytes)"
                self.imgLoadView.progressBar.progress = Float(written) / Float(total)
            }
        }).disposed(by: self.disposeBag)
        Networking.shared.cat$.subscribe(onNext: {cat in
            DispatchQueue.main.async {
                self.imgLoadView.imgView.image = cat.img
                //'고양이 이미지 받기'로 버튼 UI 변경, 저장 버튼 활성화
                self.isDownloading = false
                self.changeButtonUI()
                self.imgLoadView.progressBar.progress = 0
                self.imgLoadView.progressLabel.text = ""
                
                self.imgLoadView.catNameLabel.text = cat.name
                self.imgLoadView.catLifeExpectLabel.text = cat.lifeExpect
                
            }
        }).disposed(by: self.disposeBag)
    }
    @objc func imgSaveButtonTouched() {
        UIImageWriteToSavedPhotosAlbum(self.imgLoadView.imgView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        var resultText = ""
        if error != nil {
            resultText = String(describing: "\(error!.localizedDescription)")
        } else {
            resultText = "저장 성공"
        }
        let alertController = UIAlertController(title: "이미지 저장", message: resultText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}


