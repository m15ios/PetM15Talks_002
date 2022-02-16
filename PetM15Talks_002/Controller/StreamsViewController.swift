//
//  StreamsViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 21.01.2022.
//

import UIKit

class StreamsViewController: UIViewController {

    @IBOutlet weak var streamsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        streamsList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        streamsList.delegate = self
        streamsList.dataSource = self
    }

}


extension StreamsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = streamsList.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        cell.textLabel?.text = "cell1"
        return cell
    }
    
    // action click by cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( indexPath.row )
    }
    
    
}
