//
//  sermonpage.swift
//  NewSongPath
//
//  Created by Cherish Park on 1/13/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//


import UIKit
import YoutubePlayer_in_WKWebView

class sermonpage: UIViewController {
    
    
    @IBOutlet weak var ytplayer: WKYTPlayerView!
    var tempID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
        ytplayer.load(withVideoId:FirstViewController.tempYoutubeID)
        } catch {
        print(error)
        }
        
        // Set up your URL
//        let youtubeApi = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCawjQudNEEKBRkH5d1ArdOA&key=AIzaSyBTQBs5V9lMrNE3xKEqqDCJUTLnLblPD3w"
//
//        let url = NSURL(string: youtubeApi)
//
//        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
//            do {
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject] {
//
//                    print("Response from YouTube: \(jsonResult)")
//                }
//            }
//            catch {
//                print("json error: \(error)")
//            }
//
//        }
//        task.resume()        // Start the request

    }
    
}
