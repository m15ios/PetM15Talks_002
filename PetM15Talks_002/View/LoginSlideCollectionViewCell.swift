//
//  LoginSlideCollectionViewCell.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.11.2021.
//

import UIKit

class LoginSlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideMainText: UILabel!
    @IBAction func slideLoginBTN(_ sender: Any) {
    }
    @IBAction func slideJoinBTN(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure( content: LoginSliderItem ){
        slideMainText.text = content.mainText
        /*
        if( content.hideButtons == true ){
            print( "hide buttons" )
        } else {
            print( "show buttons" )
        }
        */
    }

}
