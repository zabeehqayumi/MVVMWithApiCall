//
//  DisplayBooksTableViewCell.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit

class DisplayBooksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var booksImage: UIImageView!
    
    @IBOutlet weak var bookNames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //bookNames.text = "Dumm book name"
        //updateStyling()
    }
    
    private func updateStyling() {
        // do your styling here
    }
}
