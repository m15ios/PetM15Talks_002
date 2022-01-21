//
//  MembersTableViewCell.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 21.01.2022.
//

import UIKit

class MembersTableViewCell: UITableViewCell {

    // if you want I can add ID here for tableViewContrioller (for what?)
    //static let cellReuseIdentifier: String = "MembersTableViewCell"
    
    @IBOutlet weak var memberName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
