//
//  DetailViewController.swift
//  projectHo
//
//  Created by Admin on 11/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
     var users = ["AAA", "BBB", "CCC"]
    var imageurls=["eee","fff","qqq"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func goback(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
    extension DetailViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return users.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            let user = users[indexPath.row]
            let url=imageurls[indexPath.row]
            cell.imgAvatar.image = UIImage(named: url)
            cell.lblName.text = user
            return cell
        }
        
        
    }

    extension DetailViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let user = users[indexPath.row]
            print(user)
        }
    

    }

