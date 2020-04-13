//
//  TrackActivity.swift
//  NewSongPath
//
//  Created by Cherish Park on 1/25/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//


import UIKit

class settings: UITableViewController{

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
}
