//
//  JsonParsing.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/23/20.
//

import Foundation

class JsonParsing {
    // Application Program Interface
    // when you make an api call, you will face two use cases:
    //1. failure
    //2. Success
    
    // typealias
    // [[String: AnyObject]]
    // ["Key": "Value"]
    // [String: Int]
    
    // https://www.googleapis.com/books/v1/volumes?q=
    
    typealias success = ([[String: AnyObject]]) -> ()
    
    static func parseJsonFile(bookName: String, onSucess: success) {
        // URL in project --> Google books URL
        if let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(bookName)") {
            // URL Session with Data Task
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                //print(data)
                do {
                    let json = try JSONDecoder().decode(BookModel.self, from: data)
                    
                } catch {
                    print("JSON file format was not supported")
                }
            }.resume()
        }
    }
}
