//
//  FavoriteViewModel.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/23/20.
//

import Foundation

class FavoriteViewModel {
    
    var favoritedBooksTitle = [String]()
    var favoritedBooksImage = [String]()
    
    func fetchBookNames() {
        let defaults = UserDefaults.standard
        if let favoritedData = defaults.object(forKey: "bookFavorites") {
            favoritedBooksTitle = favoritedData as? [String] ?? []
        }
    }
    
    func refreshFavoritedItems() {
        favoritedBooksTitle = []
        fetchBookNames()
        fetchBookImages()
    }
    
    func fetchBookImages() {
        let defaults = UserDefaults.standard
        if let favoritedData = defaults.object(forKey: "bookImages") {
            favoritedBooksImage = favoritedData as? [String] ?? []
        }
    }
}
