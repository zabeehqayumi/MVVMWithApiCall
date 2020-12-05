//
//  FavoriteViewController.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit
import Kingfisher

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    lazy var viewModel = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //deleteOldDataFromUserDefaults()
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        viewModel.fetchBookNames()
        viewModel.refreshFavoritedItems()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refreshFavoritedItems()
        favoriteTableView.reloadData()
    }
    
    func deleteOldDataFromUserDefaults() {
        let defaults = UserDefaults.standard
        // delete all book titles
        defaults.removeObject(forKey: "bookFavorites")
        defaults.synchronize()
        viewModel.favoritedBooksTitle.removeAll()
        
        // delete all images
        
        defaults.removeObject(forKey: "bookImages")
        defaults.synchronize()
        viewModel.favoritedBooksImage.removeAll()
    }
    
    private func registerCells() {
        self.favoriteTableView.register(UINib(nibName: BooksConstants.favoriteCell, bundle: nil), forCellReuseIdentifier: BooksConstants.favoriteCell)
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoritedBooksTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var newCell = UITableViewCell()
        if let cell = favoriteTableView.dequeueReusableCell(withIdentifier: BooksConstants.favoriteCell) as? FavoiretTableViewCell {
            cell.detailLabel.text = viewModel.favoritedBooksTitle[indexPath.row]
            let imageUrl = viewModel.favoritedBooksImage[indexPath.row]
            cell.largeImage.kf.setImage(with: URL(string: imageUrl))
            newCell = cell
        }
        return newCell
    }
}
