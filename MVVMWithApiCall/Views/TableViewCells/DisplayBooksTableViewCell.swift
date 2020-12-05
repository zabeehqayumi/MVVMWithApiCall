//
//  DisplayBooksTableViewCell.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit

protocol CellTappedDelegate: AnyObject {
    func favoriteItem(cell: DisplayBooksTableViewCell)
}

class DisplayBooksTableViewCell: UITableViewCell {
    
    weak var delegate: CellTappedDelegate?
    
    @IBOutlet weak var booksImage: UIImageView!
    
    @IBOutlet weak var bookNames: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton! {
        didSet {
            favoriteButton.setTitle("Favorite", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //bookNames.text = "Dumm book name"
        //updateStyling()
    }
    
    private func updateStyling() {
        // do your styling here
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        self.delegate?.favoriteItem(cell: self)
        updateFavoriteButtonState()
    }
    
    private func updateFavoriteButtonState() {
        if favoriteButton.titleLabel?.text == "Favorite" {
            favoriteButton.setTitle("Favorited", for: .normal)
        } else {
            favoriteButton.setTitle("Favorite", for: .normal)
        }
    }
}
