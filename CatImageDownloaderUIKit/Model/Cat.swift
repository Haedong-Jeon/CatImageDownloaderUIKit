//
//  Cat.swift
//  CatImageDownloaderUIKit
//
//  Created by 전해동 on 2020/12/20.
//

import Foundation

struct Cat: Decodable {
    var id: String?
    var url: String?
    var width: Int?
    var height: Int?
    var categories: [Category]?
    var breeds: [Breed]?
}
struct Category: Decodable {
    var id: Int?
    var name: String?
}
struct Breed: Decodable {
    var id: String?
    var name: String?
    var temperament: String?
    var life_span: String?
    var alt_names: String?
    var wikipedia_url: String?
    var origin: String?
    var weight_imperial: String?
}
