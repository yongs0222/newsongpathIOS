//
//  sermonpage.swift
//  newsongtime
//
//  Created by Cherish Park on 1/2/20.
//  Copyright © 2020 Newsong church. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView


class sermonpage: UIViewController {

    @IBOutlet weak var ytplayer: WKYTPlayerView!
    
//    var vc: ViewController = ViewController(nibName: nil, bundle: nil)
    var tempID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        ytplayer.load(withVideoId:ViewController.tempYoutubeID)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
