//
//  ThirdViewController.swift
//  projectHo
//
//  Created by Admin on 11/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


//        let button = UIButton()
//        button.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 50, height: 50)
//        button.backgroundColor = UIColor.red
//        button.setTitle("Name your Button ", for: .normal)
//        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
//        self.view.addSubview(button)
        
        self.view.backgroundColor = UIColor.green
           self.title = "Tab 2"
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

//  @objc func pushToNextVC() {
//        let newVC = UIViewController()
//        newVC.view.backgroundColor = UIColor.red
//        self.navigationController?.pushViewController(newVC, animated:  true)
//    print("Button tapped")
//    }
}
