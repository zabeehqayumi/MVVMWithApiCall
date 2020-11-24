//
//  BookModel.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/23/20.
//

import Foundation

struct BookModel: Codable {
    var items: Item?
}

struct Item: Codable {
    var volumeInfo: Volumes?
}

struct Volumes: Codable {
    var publisher: String?
}
