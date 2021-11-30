//
//  LoginSlideCollectionViewCell.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.11.2021.
//

import UIKit

class LoginSlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideMainText: UILabel!
    @IBOutlet weak var slideLoginButton: UIButton!
    @IBOutlet weak var slideJoinButton: UIButton!
    
    var delegate: ViewControllerDelegate!
    
    @IBAction func slideLoginBTN(_ sender: Any) {
        //print("click slideLoginBTN")
        delegate.toScreen("AuthViewController")
    }
    @IBAction func slideJoinBTN(_ sender: Any) {
        //print("click slideJoinBTN")
        delegate.toScreen("RegistrationViewController")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure( content: LoginSliderItem ){
        slideMainText.text = content.mainText
        
        if( content.hideButtons == true ){
            slideLoginButton.isHidden = true
            slideJoinButton.isHidden = true
        } else {
            slideLoginButton.isHidden = false
            slideJoinButton.isHidden = false
        }
    }

}
