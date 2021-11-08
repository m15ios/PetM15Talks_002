//
//  LoginViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.11.2021.
//

import UIKit

class LoginViewController: ViewController {

    var collectionView: UICollectionView!
    
    let nameSlideCellView: String = "LoginSlideCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func configCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView( frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .orange
        
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


extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.nameSlideCellView, for: indexPath ) as! LoginSlideCollectionViewCell
        return cell
    }

    // set size slideCell as size screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
    
}


