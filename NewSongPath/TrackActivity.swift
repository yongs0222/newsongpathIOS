//  NewSongPath
//
//  Created by Cherish Park on 4/7/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
import Firebase

class TrackActivity: UITableViewController {
    
    @IBOutlet weak var progressBar1: UIProgressView!
    @IBOutlet weak var progressBar2: UIProgressView!
    @IBOutlet weak var progressBar3: UIProgressView!
    @IBOutlet weak var progressBar4: UIProgressView!
    @IBOutlet weak var progressBar5: UIProgressView!
    @IBOutlet weak var progressBar6: UIProgressView!
    @IBOutlet weak var progressBar7: UIProgressView!
    @IBOutlet weak var progressBar8: UIProgressView!
    @IBOutlet weak var progressBar9: UIProgressView!
    @IBOutlet weak var progressBar10: UIProgressView!
    @IBOutlet weak var progressBar11: UIProgressView!
    @IBOutlet weak var progressBar12: UIProgressView!
    
    var progressList = [
        "01": 0,
        "02": 0,
        "03": 0,
        "04": 0,
        "05": 0,
        "06": 0,
        "07": 0,
        "08": 0,
        "09": 0,
        "10": 0,
        "11": 0,
        "12": 0
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
//        progressBar1.setProgress(1,animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
