//
//  sermonpage.swift
//  NewSongPath
//
//  Created by Cherish Park on 1/13/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//


import UIKit
import Firebase
import YoutubePlayer_in_WKWebView

class sermonpage: UIViewController {
    
    @IBOutlet weak var ytplayer: WKYTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let youtube = Storage.storage().reference().child("youtube.txt")
        youtube.downloadURL { (URL, error) -> Void in
            if (error != nil) {
                print("Error!!!!!!!!!!!!!!!!")
            } else {
                do {
                    let contents = try String(contentsOf: URL!)
                    var link = contents.split(separator: "=")
                    
                    // 여기서부터 하시면 됩니다 link[1]이 유튜브 아이디입니다
                    self.ytplayer.load(withVideoId:String(link[1]))
                } catch {
                    
                }
                
            }
        }
        
    }
}
