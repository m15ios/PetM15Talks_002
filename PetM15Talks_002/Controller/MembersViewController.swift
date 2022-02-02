//
//  MembersViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 21.01.2022.
//

import UIKit

class MembersViewController: UIViewController {
    
    @IBOutlet weak var membersTable: UITableView!
  
    let cellID: String = "MembersTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //add id for table cell
        membersTable.register(UINib(nibName: "MembersTableViewCell", bundle: nil),forCellReuseIdentifier: cellID)
        
        membersTable.dataSource = self
        membersTable.delegate = self
        membersTable.separatorStyle = .none
        
        getMembers()
    }
    
    let membersStorage = Members.hole

    var members = [String]()
    
    func getMembers(){
        membersStorage.getMembersList{ users in
            self.members = users
            self.membersTable.reloadData()
        }
    }
    

}

extension MembersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = membersTable.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MembersTableViewCell
        //cell.memberName.text = "User Name #" + String( indexPath.item + 1 )
        cell.memberName.text = members[ indexPath.row ]
        cell.selectionStyle = .none
        return cell
    }
    
    
}
