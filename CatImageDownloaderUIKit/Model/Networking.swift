//
//  Networking.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import UIKit
import RxSwift

typealias cat = (img: UIImage, name: String, lifeExpect: String)

class Networking: NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    //싱글톤 패턴 구현
    private override init() {}
    static let shared = Networking()
    //Properties
    let apiKey = "1c3e7e7c-965e-4edd-8793-55c58caa0f3e"
    let urlString = "https://api.thecatapi.com/v1/images/search"
    var writtenBytes: Int64 = 0
    var totalBytes: Int64 = 0
    var catPublish = PublishSubject<cat>()
    var cat$: Observable<cat> {
        return catPublish.asObservable()
    }
    var writtenBytePublish = PublishSubject<Int64>()
    var written$: Observable<Int64> {
        return writtenBytePublish.asObservable()
    }
    var totalBytePublish = PublishSubject<Int64>()
    var total$: Observable<Int64> {
        return writtenBytePublish.asObservable()
    }
    func loadCatImg() {
        guard let url = URL(string: urlString) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(apiKey, forHTTPHeaderField: "Authorization")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        session.downloadTask(with: urlRequest).resume()
    }
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {
        
        
        guard let data = try? Data(contentsOf: location) else { return }
        guard let res = try? JSONDecoder().decode([Cat].self, from: data) else { return }
        guard let imgURL = URL(string: res[0].url!) else { return }
        guard let imgData = try? Data(contentsOf: imgURL) else { return }
        guard let img = UIImage(data: imgData) else { return }
        
        if !res[0].breeds!.isEmpty {
            let nameBase = "이름: "
            let name = res[0].breeds![0].name ?? "정보 없음"
            let lifeBase = "수명: "
            let life = res[0].breeds![0].life_span ?? "정보 없음"
            let cat = (img, nameBase + name, lifeBase + life)
            catPublish.onNext(cat)
        } else {
            let cat = (img, "이름: 정보 없음", "수명: 정보 없음")
            catPublish.onNext(cat)
        }
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        writtenBytes = totalBytesWritten
        totalBytes = totalBytesExpectedToWrite
        writtenBytePublish.onNext(writtenBytes)
        totalBytePublish.onNext(totalBytes)
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil { print(String(describing: error)) }
    }
}
