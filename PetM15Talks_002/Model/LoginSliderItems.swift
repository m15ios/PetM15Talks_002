//
//  LoginSliderItems.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 10.11.2021.
//

import Foundation

struct LoginSliderItem {
    
    var mainText: String
    
    var hideButtons: Bool = true
    
}

func getLoginSliderItems() -> Array<LoginSliderItem>? {
    
    var slides: Array<LoginSliderItem> = Array()
    
    slides.append( LoginSliderItem(mainText: "Some text for first screen", hideButtons: true) )
    slides.append( LoginSliderItem(mainText: "Some longer text for second screen", hideButtons: true) )
    slides.append( LoginSliderItem(mainText: "Some finish text for thirt screen", hideButtons: false) )
    
    return slides
}
