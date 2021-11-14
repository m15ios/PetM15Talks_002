//
//  WelcomeViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.11.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    var collectionView: UICollectionView!
    lazy var loginSlides: Array<LoginSliderItem>? = nil
    
    let nameSlideCellView: String = "LoginSlideCollectionViewCell"
    
    
    
    override func viewDidLoad() {
        if let slides = getLoginSliderItems() {
            loginSlides = slides
        }
        configCollectionView()
        super.viewDidLoad()
    }
    
    func configCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView( frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .orange
        // slide to paging
        collectionView.isPagingEnabled = true
        
        // add to view
        self.view.addSubview( collectionView )
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // add cells
        collectionView.register(UINib(nibName: self.nameSlideCellView, bundle: nil), forCellWithReuseIdentifier: self.nameSlideCellView)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let cnt = loginSlides?.count {
            return cnt
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.nameSlideCellView, for: indexPath ) as! LoginSlideCollectionViewCell
        if let slide = loginSlides?[indexPath.row] {
            cell.configure(content: slide)
        }
        cell.delegate = self
        return cell
    }

    // set size slideCell as size screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
    
}

protocol WelcomeViewControllerDelegate {
    func toScreen( _ name: String)
}

extension WelcomeViewController: WelcomeViewControllerDelegate{
    func toScreen( _ name: String ){
        let currentStoryboardController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)
        self.view.insertSubview( currentStoryboardController.view, at: 1)
        //self.window?.rootViewController = currentStoryboardController
        //self.window?.makeKeyAndVisible()
    }

    
}
