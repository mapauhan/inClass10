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
    var userNow: String?
    var userName: String?
    var post: Post?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "ForumTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "forumCell")
        
        //check who is logged in
        if Auth.auth().currentUser != nil {
            userNow = Auth.auth().currentUser?.email
            
            if let i = userNow?.index(of: "@") {
                let name = userNow?[..<i]
                userName = String(name!)
            }
     
        } else {
            //No user
        }

        let ref = Database.database().reference()
        //retrieves all forums
        ref.child("/").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot != nil {
                self.forums = snapshot.value as? [String:Any]
                self.tableView.reloadData()
            }
            
        }
        
        /**
         
         // ref.child("forums/likes").setValue(15)
         //        ref.childByAutoId().setValue(["author": "bsmith", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 28, "comment": "awesome!"])
         //        ref.childByAutoId().setValue(["author": "mjh", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 108, "comment": "i'm confused"])
         //        ref.childByAutoId().setValue(["author": "lorena", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 48, "comment": "que es esto"])
         //        ref.childByAutoId().setValue(["author": "liz", "content": "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", "likes": 0, "comment": "HELLO?!?!!"])

         
         **/

}
    
    @IBAction func addButtonClicked(_ sender: Any) {
      
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newForumSegue" {
        
            let destinationVC = segue.destination as! NewForumViewController
            destinationVC.userName = self.userName
    }
        if segue.identifier == "commentSegue" {
            let destination = segue.destination as! ForumsTwoViewController
            destination.forum = self.post
            print("post \(post)")
            destination.userName = userName
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
        
        let data = Forum(((self.forums) as? [String:Any]!)!)
        var myForums = data.posts
    
        let forumData = myForums[indexPath.row]
        let likes = forumData.likes! as? Int
        let author = forumData.author! as? String
        
        //prints data onto tableview
        cell.nameLabel.text = author!
        cell.multiTextLabel.text = forumData.text! as String
        cell.likesLabel.text = String("\(likes!) likes")
        cell.idKey.text = forumData.id
        
        //checks if hearticon has been clicked
        if likes! > 0 {
            cell.heartIcon.image = UIImage(named: "like_favorite")
        } else {
            cell.heartIcon.image = UIImage(named: "like_not_favorite")
        }
        
        //if user is logged in he/she can delete her own post only
        if author! == userName! {
            cell.trashIcon.image = UIImage(named: "rubbish-bin")
            
//            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete this?", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(alert, animated: true)
        } else {
            cell.trashIcon.image = nil
        }
 
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "forumCell") as! ForumTableViewCell
        
        post = Post(newCell.idKey.text!, newCell.nameLabel.text!, newCell.multiTextLabel.text!, Int(newCell.likesLabel.text!),  newCell.multiTextLabel.text!)

        print("Selected row\(userName)")
        performSegue(withIdentifier: "commentSegue", sender: nil)
       // selectedRow = indexPath.row
        
    }
    
}



extension ForumsViewController: CellDelegate {
    func likedClicked(cell: UITableViewCell) {
        
    }

    func deleteClicked(cell: UITableViewCell) {
        
        let ref = Database.database().reference()
        
        let myCell = cell as! ForumTableViewCell
        let childRef = Database.database().reference(withPath: myCell.idKey.text!)
        childRef.removeValue()
        
        
//        forums.remove(at: (indexPath?.row)!)
        //print(" \(indexPath!) deleted")
        tableView.reloadData()

    }
}
