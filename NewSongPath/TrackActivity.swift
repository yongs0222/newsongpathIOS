//  NewSongPath
//
//  Created by Cherish Park on 4/7/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
import FirebaseDatabase

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
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    var ref = Database.database().reference()
    
    var numofJan = 0
    var numofFeb = 0
    var numofMar = 0
    var numofApr = 0
    var numofMay = 0
    var numofJun = 0
    var numofJul = 0
    var numofAug = 0
    var numofSep = 0
    var numofOct = 0
    var numofNov = 0
    var numofDec = 0

    var progress = 0.0
    var uuid = getID().getUUID()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monthRef = Database.database().reference().child("track").child(uuid!)
        
        monthRef.child("2020/01").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofJan += 1
                }
            }
            print(self.numofJan)
            self.progress = Double(self.numofJan) / 31.0
            self.progressBar1.setProgress(Float(self.progress) , animated: false)
            self.numofJan = 0
        })
        
        monthRef.child("2020/02").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofFeb += 1
                }
            }
            self.progress = Double(self.numofFeb) / 29.0
            self.progressBar2.setProgress(Float(self.progress) , animated: false)
               self.numofFeb = 0
        })
        
        monthRef.child("2020/03").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofMar += 1
                }
            }
            self.progress = Double(self.numofMar) / 31.0
            self.progressBar3.setProgress(Float(self.progress) , animated: false)
              self.numofMar = 0
        })
        
        
        monthRef.child("2020/04").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofApr += 1
                }
            }
            self.progress = Double(self.numofApr) / 30.0
            self.progressBar4.setProgress(Float(self.progress) , animated: false)
             self.numofApr = 0
        })
        
        monthRef.child("2020/05").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofMay += 1
                }
            }
            self.progress = Double(self.numofMay) / 31.0
            self.progressBar5.setProgress(Float(self.progress) , animated: false)
              self.numofMay = 0
        })
        
        monthRef.child("2020/06").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofJun += 1
                }
            }
            self.progress = Double(self.numofJun) / 30.0
            self.progressBar6.setProgress(Float(self.progress) , animated: false)
            self.numofJun = 0
        })
        
        monthRef.child("2020/07").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofJul += 1
                }
            }
            self.progress = Double(self.numofJul) / 31.0
            self.progressBar7.setProgress(Float(self.progress) , animated: false)
             self.numofJul = 0
        })
        
        monthRef.child("2020/08").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofAug += 1
                }
            }
            self.progress = Double(self.numofAug) / 30.0
            self.progressBar8.setProgress(Float(self.progress) , animated: false)
            self.numofAug = 0
        })
        
        monthRef.child("2020/09").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofSep += 1
                }
            }
            self.progress = Double(self.numofSep) / 30.0
            self.progressBar9.setProgress(Float(self.progress) , animated: false)
            self.numofSep = 0
        })
        
        monthRef.child("2020/10").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofOct += 1
                }
            }
//            print("oct :\(self.numofOct)")
            self.progress = Double(self.numofOct) / 30.0
            self.progressBar10.setProgress(Float(self.progress) , animated: false)
            self.numofOct = 0
        })
        
        monthRef.child("2020/11").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofNov += 1
                }
            }
            self.progress = Double(self.numofNov) / 31.0
            self.progressBar11.setProgress(Float(self.progress) , animated: false)
            self.numofNov = 0
        })
        
        monthRef.child("2020/12").observe(.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
            let current = snapshot.value as! [String: Bool]
            for (_, value) in current{ //for(key, value)
                if value == true{
                    self.numofDec += 1
                }
            }
            self.progress = Double(self.numofDec) / 31.0
            self.progressBar12.setProgress(Float(self.progress) , animated: false)
            self.numofDec = 0
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
