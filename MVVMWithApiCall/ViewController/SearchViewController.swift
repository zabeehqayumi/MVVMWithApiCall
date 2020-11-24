//
//  SearchViewController.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = UITableViewCell()
        
        return newCell
    }
}
