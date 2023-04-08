//
//  ClosetCell.swift
//  dapperling
//
//  Created by Cadence Chan on 4/8/23.
//

import UIKit

class ClosetCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var shirt: UIImageView!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
