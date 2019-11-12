//
//  CustomhViewController.swift
//  projectHo
//
//  Created by Admin on 11/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
class CustomhViewController: UIViewController {
    
    
    @IBOutlet var buttons : [UIButton]!
    @IBOutlet weak var imghome: UIImageView!
    @IBOutlet weak var imgChat: UIImageView!
    @IBOutlet weak var imgAccount: UIImageView!
    @IBOutlet weak var imgFollow: UIImageView!
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var lbHome: UILabel!
    @IBOutlet weak var lbChat: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    @IBOutlet weak var lbFollow: UILabel!
    @IBOutlet weak var lbSearch: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    var indexvc = -1
    var imgSelects=["ic_home_on", "ic_charting_on", "ic_search_on","ic_flag_on","ic_user_on"]
    var imgunSelects=["ic_home_off", "ic_charting_off", "ic_search_off","ic_flag_off","ic_user_off"]
    
    
  
  
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
         lbHome.textColor = UIColor(red: 14/255.0, green: 64/255.0, blue: 201/255.0, alpha: 1)
        lbChat.textColor = UIColor.gray
        lbSearch.textColor = UIColor.gray
        lbFollow.textColor = UIColor.gray
        lbAccount.textColor = UIColor.gray
 
    }
    
    @IBAction func didPreeTab(_ sender: UIButton) {
        imghome.image = UIImage(named: imgunSelects[0])
        imgChat.image = UIImage(named: imgunSelects[1])
        imgSearch.image = UIImage(named: imgunSelects[2])
        imgFollow.image = UIImage(named: imgunSelects[3])
        imgAccount.image = UIImage(named: imgunSelects[4])
        lbHome.textColor = UIColor.gray
        lbChat.textColor = UIColor.gray
        lbSearch.textColor = UIColor.gray
        lbFollow.textColor = UIColor.gray
        lbAccount.textColor = UIColor.gray
        switch sender.tag{
        case 1:
           imghome.image = UIImage(named: imgSelects[0])
//           lbHome.textColor = UIColor(named: "#0e40c9")
           lbHome.textColor = UIColor(red: 14/255.0, green: 64/255.0, blue: 201/255.0, alpha: 1)
           
         
           let vc = storyboard?.instantiateViewController(withIdentifier: "nav_home") as! UINavigationController
           //Add View Controller as Child View Controller
           self.add(vc : vc, nextview : 1)

           
        break
        case 2:
            imgChat.image = UIImage(named: imgSelects[1])
            lbChat.textColor = UIColor(red: 14/255.0, green: 64/255.0, blue: 201/255.0, alpha: 1)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "nav_chat") as! UINavigationController
            //Add View Controller as Child View Controller
            self.add(vc : vc, nextview : 2)
            
        break
        case 3:
            imgSearch.image = UIImage(named: imgSelects[2])
            lbSearch.textColor = UIColor(red: 14/255.0, green: 64/255.0, blue: 201/255.0, alpha: 1)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "nav_search") as! UINavigationController
            //Add View Controller as Child View Controller
            self.add(vc : vc, nextview : 3)
            
        break
        case 4:
            imgFollow.image = UIImage(named: imgSelects[3])
            lbFollow.textColor = UIColor(red: 14/255.0, green: 64/255.0, blue: 201/255.0, alpha: 1)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "nav_follow") as! UINavigationController
            //Add View Controller as Child View Controller
            self.add(vc : vc, nextview : 4)
            
        break
        case 5:
            imgAccount.image = UIImage(named: imgSelects[4])
            lbAccount.textColor = UIColor(rgb: 0x0e40c9)
//            lbAccount.textColor = UIColor(red: 14/255.0, green: 64/255.0, blue: 201/255.0, alpha: 1)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "nav_account") as! UINavigationController
            //Add View Controller as Child View Controller
            self.add(vc : vc, nextview : 5)
            
        break
            
        default:
           
            break
            
        }
       
        
    }
    
    func add(vc : UIViewController , nextview : Int) {
               //Add Child View Controller
               addChild(vc)
               //Add Child View as Subview
               view.addSubview(vc.view)
               //Configure Child View
               vc.view.frame = viewContainer.bounds
               vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
               //Notify Child View Controller
               vc.didMove(toParent: self)
                viewContainer.addSubview(vc.view)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//
//           // Create Tab one
//           let tabOne = FristViewController()
//           let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "eee.png"), selectedImage: UIImage(named: "selectedImage.png"))
//
//           tabOne.tabBarItem = tabOneBarItem
//
//
//           // Create Tab two
//           let tabTwo = SecondViewController()
//           let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "fff.png"), selectedImage: UIImage(named: "selectedImage2.png"))
//
//           tabTwo.tabBarItem = tabTwoBarItem2
//
//        // Create Tab three
//        let tabThree = ThirdViewController()
//        let tabTwoBarItem3 = UITabBarItem(title: "Tab 3", image: UIImage(named: "qqq.png"), selectedImage: UIImage(named: "selectedImage2.png"))
//
//        tabThree.tabBarItem = tabTwoBarItem3
//
//
//        self.viewControllers = [tabOne, tabTwo,tabThree]
//
//       }
    
//
//       // UITabBarControllerDelegate method
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//
//           print("Selected \(viewController.title!)")
//       }

    
    
    @IBAction func back3(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    
}
