//
//  CollectionsampleViewController.swift
//  projectHo
//
//  Created by Admin on 11/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CollectionsampleViewController: UIViewController {
    var users = ["AAA", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC", "BBB", "CCC"]
    var imageurls=["eee","fff","qqq","fff","qqq","fff","qqq","fff","qqq","fff","qqq","fff","qqq","fff","qqq","fff","qqq","fff","qqq"]
    var screenwidth = UIScreen.main.bounds.width
    var screenheight = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backview(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension CollectionsampleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell",for: indexPath) as! UserCollectionViewCell
        let user = users[indexPath.item]
        item.imgAdater.image = UIImage(named: imageurls[indexPath.item])
        item.lbName.text = user
        return item
    }
    
    
    
}
extension CollectionsampleViewController: UICollectionViewDelegate{
    @available(iOS 13.0, *)
   
    
    func collectionview(_ collectionview: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        print(user)
    }
}
extension CollectionsampleViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexpath:IndexPath)->CGSize{
        let width=(screenwidth-50)/3
        let height=screenheight/8
        return CGSize(width:width, height:height)
    }
    
}
