//
//  MembersViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 21.01.2022.
//

import UIKit

class MembersViewController: UIViewController {

    let cellID: String = "MembersTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //add id for table cell 
        membersTable.register(UINib(nibName: "MembersTableViewCell", bundle: nil),forCellReuseIdentifier: cellID)
        
        membersTable.dataSource = self
        membersTable.delegate = self
        
    }
    
    @IBOutlet weak var membersTable: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MembersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = membersTable.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MembersTableViewCell
        return cell!
    }
    
    
}
