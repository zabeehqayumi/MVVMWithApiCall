//
//  SearchViewController.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    
    let apples = ["1","2","3","4","5","6"]
    let bananas = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        registerCells()

    }
    
    private func registerCells() {
        searchTableView.register(UINib(nibName: BooksConstants.booksCell, bundle: nil), forCellReuseIdentifier: BooksConstants.booksCell)
        searchTableView.register(UINib(nibName: BooksConstants.favoriteCell, bundle: nil), forCellReuseIdentifier: BooksConstants.favoriteCell)
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        if section == 0 {
            numberOfRows = bananas.count
        } else if section == 1 {
            numberOfRows = apples.count
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var newCell = UITableViewCell()
        
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: BooksConstants.favoriteCell) as? FavoiretTableViewCell {
                cell.detailLabel.text = bananas[indexPath.row]
                newCell = cell
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: BooksConstants.booksCell) as? DisplayBooksTableViewCell {
                cell.bookNames.text = apples[indexPath.row]
                newCell = cell
            }
        }
        return newCell
    }
}
