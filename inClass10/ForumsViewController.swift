//
//  ForumsViewController.swift
//  InClass09
//
//  Created by Shehab, Mohamed on 3/27/19.
//  Copyright © 2019 UNCC. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ForumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var forums: [String:Any]?
    var cUser: String?
    var userName: String?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set and register custom cell
        let cellNib = UINib(nibName: "ForumTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "forumCell")

        // who's in?
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            //print("currentUser \(Auth.auth().currentUser)")
            cUser = Auth.auth().currentUser?.email
            
            if let i = cUser?.index(of: "@") {
                let name = cUser?[..<i]
                print (name!)
                userName = String(name!)
            }
            
            
        } else {
            // No user is signed in.
            // ...
        }
        
        let ref = Database.database().reference()
        
        ref.child("/").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot != nil {
                self.forums = snapshot.value as? [String:Any]
                self.tableView.reloadData()
            }
            
        }
        
        /**
         fake data for testing
         
         // ref.child("forums/likes").setValue(15)
         ref.childByAutoId().setValue(["author": "bsmith", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 28, "comment": "awesome!"])
         ref.childByAutoId().setValue(["author": "mjh", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 108, "comment": "i'm confused"])
         ref.childByAutoId().setValue(["author": "lorena", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 48, "comment": "que es esto"])
         ref.childByAutoId().setValue(["author": "liz", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 0, "comment": "HELLO?!?!!"])
         ref.childByAutoId().setValue(["author": "j", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 28, "comment": "awesome!"])
         ref.childByAutoId().setValue(["author": "j", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 108, "comment": "i'm confused"])
         ref.childByAutoId().setValue(["author": "j", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 48, "comment": "que es esto"])

         
         **/

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.forums == nil {
            return 0
        } else {
        
        return forums!.count
    }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forumCell", for: indexPath) as! ForumTableViewCell
        
        let data = Forum((self.forums as? [String:Any]!)!)
        var myForums = data.posts
        
        let fd = myForums[indexPath.row]
        let author = fd.author! as? String
        let likes = fd.likes! as? Int
        
        
            cell.nameLabel.text = author!
            cell.likesLabel.text = String(likes!)
            cell.multiTextLabel.text = fd.text as? String
        
        
        if author! == userName! {
            cell.trashIcon.image = UIImage(named: "rubbish-bin")
        } else {
            cell.trashIcon.image = nil
        }
        
        if likes! > 0 {
            cell.heartIcon.image = UIImage(named: "like_favorite")
        } else {
            cell.heartIcon.image = UIImage(named: "like_not_favorite")
        }
        return cell
    }
}
