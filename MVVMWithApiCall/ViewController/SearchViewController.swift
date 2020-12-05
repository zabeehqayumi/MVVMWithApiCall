//
//  SearchViewController.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    @IBOutlet weak var booksSearchBar: UISearchBar! {
        didSet {
            booksSearchBar.placeholder = "Search books name here..."
        }
    }
    
    @IBOutlet weak var searchTableView: UITableView!
    
    lazy var viewModel = SearchViewModel()
    var temporaryImagesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.booksSearchBar.delegate = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalNumberOfBooks() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var newCell = UITableViewCell()
        if let cell = searchTableView.dequeueReusableCell(withIdentifier: BooksConstants.booksCell) as? DisplayBooksTableViewCell {
            cell.bookNames.text = viewModel.getBookTitle(at: indexPath.row)
            if let urlString = viewModel.getBookImage(at: indexPath.row) {
                temporaryImagesArray.append(urlString)
                cell.booksImage.kf.setImage(with: URL(string: urlString))
            }
            cell.delegate = self
            newCell = cell
        }
        
        return newCell
    }
}

extension SearchViewController: UISearchBarDelegate, SearchViewModelDelegate {
    func updateBooks() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        viewModel.searchBooks(text: text)
        searchBar.resignFirstResponder()
        searchBar.text = ""
        temporaryImagesArray.removeAll()
    }
}

extension SearchViewController: CellTappedDelegate {
    func favoriteItem(cell: DisplayBooksTableViewCell) {
        if let bookName = cell.bookNames.text {
            viewModel.favoriteBookName(nameOfBook: bookName)
        }
        
        guard let indexPath = searchTableView.indexPath(for: cell) else { return }
        viewModel.favoriteBookImage(imageUrl: temporaryImagesArray[indexPath.row])
    }
}
