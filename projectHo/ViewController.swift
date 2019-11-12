//
//  ViewController.swift
//  projectHo
//
//  Created by Admin on 11/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    var users = ["AAA", "BBB", "CCC"]
    @IBOutlet weak var uibutton: UIButton!
    @IBOutlet weak var btn_Gocollectionview: UIButton!
    @IBOutlet weak var btn_gotabbar: UIButton!
    @IBOutlet weak var btn_download: UIButton!
    @IBOutlet weak var pagerFlow: UIPageControl!
    
    @IBOutlet weak var textFlowcollectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        UIinit()
    }
    @objc func update(){
        var index=pagerFlow.currentPage
        index = index+1
      textFlowcollectionview.scrollToItem(at:IndexPath(item: index % users.count, section: 0), at: .right, animated: true)
    }
    func UIinit(){
        uibutton.layer.borderColor = UIColor.white.cgColor
        btn_Gocollectionview.layer.borderColor = UIColor.white.cgColor
        btn_gotabbar.layer.borderColor = UIColor.white.cgColor
        btn_download.layer.borderColor = UIColor.white.cgColor
        pagerFlow.numberOfPages=users.count
        
    }
    
    @IBAction func gocollectionview(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "CollectionsampleViewController") as! CollectionsampleViewController
                      navigationController?.pushViewController(vc1, animated: true)
    }
    @IBAction func gotableview(_ sender: Any) {
         let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
               navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func go_tabbar(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CustomhViewController") as! CustomhViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func download(_ sender: Any) {
        guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }
        
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        
    }
    
    
    @IBAction func open_other_app(_ sender: Any) {
        var instagramHooks = "instagram://user?username=your_username"
        var instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL)
        {
            UIApplication.shared.openURL(instagramUrl! as URL)

        } else {
            //redirect to safari because the user doesn't have Instagram
            print("App not installed")
            UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/in/app/instagram/id389801252?m")! as URL)

        }
    }
    

    

}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item=collectionView.dequeueReusableCell(withReuseIdentifier: "TextflowCollectionViewCell", for: indexPath) as! TextflowCollectionViewCell
        let user = users[indexPath.item]
        item.textflow.text=user
        return item
        
    }
    
    
}
extension ViewController :UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user=users[indexPath.item]
        print(user)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        pagerFlow.currentPage = collectionView.indexPath(for: collectionView.visibleCells.first!)!.item
    }
       
     
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize{
        let width=collectionView.frame.width
        let height=collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}















extension ViewController:  URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("downloadLocation:", location)
        // create destination URL with the original pdf name
        guard let url = downloadTask.originalRequest?.url else { return }
        let documentsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
        // delete original copy
        try? FileManager.default.removeItem(at: destinationURL)
        // copy from temp to Document
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
//            self.pdfURL = destinationURL
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
}

