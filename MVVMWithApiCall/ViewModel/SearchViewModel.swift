//
//  SearchViewModel.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/23/20.
//

import Foundation

protocol SearchViewModelDelegate: class {
    func updateBooks()
}

class SearchViewModel {
    
    var book: BookModel?
    
    weak var delegate: SearchViewModelDelegate?
    
    /// Function that search the name of books based on entry from user and returns the list (Array) of books.
    /// - Parameter text: book name based on user entry
    func searchBooks(text: String) {
        JsonParsing.parseJsonFile(bookName: text) { [weak self] books in
            self?.book = books
            self?.delegate?.updateBooks()
        }
    }
    
    /// Function to retunr the name of books based on the user entry
    /// - Parameter index: based on user type book name for each index
    /// - Returns: return only a book name as string, if does not exist then return the default as empty string.
    func getBookTitle(at index: Int) -> String? {
        let bookName = book?.items?.object(at: index)?.volumeInfo?.title
        return bookName ?? ""
    }
    
    /// Function that returns total number of books
    /// - Returns: return total books
    func getTotalNumberOfBooks() -> Int? {
        let totalBooks = book?.items?.count
        return totalBooks ?? 0
    }
    
    /// Function returns an image of books
    /// - Parameter index: based on indexpath in the row
    /// - Returns: returns the image url as string
    func getBookImage(at index: Int) -> String? {
        let bookImage = book?.items?.object(at: index)?.volumeInfo?.imageLinks?.thumbnail
        return bookImage ?? ""
    }
}
