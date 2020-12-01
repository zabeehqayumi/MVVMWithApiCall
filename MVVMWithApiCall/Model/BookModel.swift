//
//  BookModel.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/23/20.
//

import Foundation

struct BookModel: Codable {
    var items: [Volume]?
}

struct Volume: Codable {
    var volumeInfo: VolumeInfo?
}

struct VolumeInfo: Codable {
    var title: String?
    var imageLinks: ImageLinks?
}

struct ImageLinks: Codable {
    var thumbnail: String?
}
