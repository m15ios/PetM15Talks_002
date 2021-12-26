//
//  WelcomeViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.11.2021.
//

import UIKit

class WelcomeViewController: ViewController {

    var collectionView: UICollectionView!
    lazy var loginSlides: Array<LoginSliderItem>? = nil
    
    let nameSlideCellView: String = "LoginSlideCollectionViewCell"
    
    // for delegate extension
    var authViewController: AuthViewController!
    var registrationViewController: RegistrationViewController!
    var mainViewController: MainViewController!

    
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

extension WelcomeViewController: ViewControllerDelegate{
    
    func toScreen( _ name: String ){
        print("try to change screen view to \(name)")
        switch( name ){
            case "AuthViewController":
                if authViewController == nil {
                    authViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)// as! AuthViewController
                    authViewController.delegate = self
                    self.view.insertSubview( authViewController.view, at: 1)
                }
                break
            case "RegistrationViewController":
                if registrationViewController == nil {
                    registrationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)// as! RegistrationViewController
                    registrationViewController.delegate = self
                    self.view.insertSubview( registrationViewController.view, at: 1)
                }
                break
            case "MainViewController":
                if authViewController != nil {
                    authViewController.view.removeFromSuperview()
                    authViewController = nil
                }
                if registrationViewController != nil {
                    registrationViewController.view.removeFromSuperview()
                    registrationViewController = nil
                }
                if mainViewController == nil {
                    mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)// as! MainViewController
                    //mainViewController.delegate = self
                    self.view.insertSubview( mainViewController.view, at: 1)
                }
                break
            case "BackToWelcome":
                if authViewController != nil {
                    authViewController.view.removeFromSuperview()
                    authViewController = nil
                }
                if registrationViewController != nil {
                    registrationViewController.view.removeFromSuperview()
                    registrationViewController = nil
                }
                break
            default:
                print( "toString switch error" )
                break
        }
        //self.window?.rootViewController = currentStoryboardController
        //self.window?.makeKeyAndVisible()
    }

    
}
