//
//  ForumsViewController.swift
//  InClass09
//
//  Created by Shehab, Mohamed on 3/27/19.
//  Copyright © 2019 UNCC. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForumsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        //AppDelegate.showForums()
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        //logout user in firebase first
        //then go to the login screen
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            AppDelegate.showLogin()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
}
