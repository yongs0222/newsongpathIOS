//
//  FirstViewController.swift
//  NewSongPath
//
//  Created by ImSandy on 1/10/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var jiyuck: UIButton!
    @IBOutlet weak var homepage: UIButton!
    @IBOutlet weak var jooho: UIButton!
    @IBOutlet weak var sermon: UIButton!
    @IBOutlet weak var goodnews: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homepage = Storage.storage().reference().child("homepage.txt")
        homepage.downloadURL { (URL, error) -> Void in
            if (error != nil) {
                print("Error!!!!!!!!!!!!!!!!")
            } else {
                do {
                    let contents = try String(contentsOf: URL!)
                    self.textView.text = contents
                } catch {
                    
                }
                
            }
        }
        
        let image = Storage.storage().reference().child("main_pic.jpg")
        image.getData(maxSize: (1 * 1024 * 1024)) { (data, error) in
            if let _error = error{
                print(_error)
            } else {
                if let _data  = data {
                    let myImage:UIImage! = UIImage(data: _data)
                    self.imageView.image = myImage
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func sermonpage(_ sender: Any) {
    }
    
    @IBAction func joobopage(_ sender: Any) {
        //"http://www.newsongdallas.org/tong/s_board/list.asp?board_seq=6&chk_ON=undefined&lef=02&sublef=undefined")
        if let url = URL(string:
            "http://www.newsongdallas.org/tong/weekly/weekly_V2.asp?"){
            UIApplication.shared.open(url)
        }
    }
    @IBAction func goodnewspage(_ sender: Any) {
        //"http://www.newsongdallas.org/tong/s_board/list.asp?board_seq=6&chk_ON=undefined&lef=02&sublef=undefined")
        if let url = URL(string:
            "http://url.kr/NlTV9c"){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func outreachpage(_ sender: Any) {
        
        if let url = URL(string: "http://www.newsongdallas.org/tong/uotc/uotc_view.asp?uotc_code=5152&uotc=24258&lef=05&sublef=undefined"){
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func homepage(_ sender: Any) {
        if let url = URL(string: "http://www.newsongdallas.org") {
            UIApplication.shared.open(url)
        }
        
    }
    
}

