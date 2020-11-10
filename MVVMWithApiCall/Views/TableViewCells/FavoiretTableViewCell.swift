//
//  FavoiretTableViewCell.swift
//  MVVMWithApiCall
//
//  Created by Zab on 11/9/20.
//

import UIKit

class FavoiretTableViewCell: UITableViewCell {
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
