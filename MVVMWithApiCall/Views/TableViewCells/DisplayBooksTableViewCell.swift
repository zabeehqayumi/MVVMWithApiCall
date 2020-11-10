//
//  DisplayBooksTableViewCell.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit

class DisplayBooksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var booksImage: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var bookNames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateStyling()
    }
    
    private func updateStyling() {
        // do your styling here
    }
}
