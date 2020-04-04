//
//  FirstViewController.swift
//  NewSongPath
//
//  Created by ImSandy on 1/10/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
import SwiftSoup
//import WebKit
//import YoutubePlayer_in_WKWebView

class FirstViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    //    @IBOutlet weak var ytplayer: WKYTPlayerView!
    @IBOutlet weak var jiyuck: UIButton!
    @IBOutlet weak var homepage: UIButton!
    @IBOutlet weak var jooho: UIButton!
    @IBOutlet weak var sermon: UIButton!
    @IBOutlet weak var goodnews: UIButton!
    
    
    var builder: StringBuilder!
    var htmlContentInStringFormat = ""
    var tempString = ""
    var tempImage = ""
    var tempSplit: [String] = []
    static var tempYoutubeID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseUrl = "http://www.newsongdallas.org/tong/s_board/read.asp?board_seq=28&board_sub_seq=1&view_sub_seq=0&seq=2562&lef=06&sublef=undefined&page=1&search_select=&search_text="
        
     
//        let html = try! String(contentsOf: url, encoding: String.Encoding(rawValue: encoding))
        
        do{
            let url = URL(string: baseUrl)!
                 let encoding:UInt =  CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(
                     CFStringEncodings.EUC_KR.rawValue))
            
            let html = try String(contentsOf: url, encoding: String.Encoding(rawValue: encoding))

            let doc: Document = try SwiftSoup.parse(html)
            
            for titleContents in try! doc.select("div.sboard_cont_details > p") {
                tempString = (textView.text ?? "") + "\n" + (try titleContents.text())
                
                //parsing 말씀
                if (tempString.contains("https://")){
                    let urlLink = try titleContents.text()
                    tempSplit = urlLink.components(separatedBy: "=")
                    FirstViewController.tempYoutubeID = tempSplit[1]
                    //                    tempYoutubeID = tempSplit[1]
                    //                    ytplayer.load(withVideoId: tempYoutubeID)
                    
                } else{
                    textView.text = tempString
                }
            }
            let srcs: Elements = try doc.select("div.sboard_cont_details img[src]")
            let tempSrc = try srcs.attr("src")
            //                print(tempSrc)
            
            let tempUrl = URL(string: "http://www.newsongdallas.org" + tempSrc)
            
            let data = try Data(contentsOf: tempUrl! as URL)
            imageView.image = UIImage(data: data)
            
            
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            textView.text = "Check network connection. Restart New Song Path"
            
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

