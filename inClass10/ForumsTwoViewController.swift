
//  ForumsTwoViewController.swift
//  inClass10
//
//  Created by Maria Handschu on 4/8/19.
//  Copyright © 2019 Handschu, Maria. All rights reserved.
//

import UIKit

class ForumsTwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    var forum: Post?
    var userName: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "ForumTablewViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "forumCell")
        print("forum \(forum)")
        print("userName\(userName)")
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forumCell", for: indexPath) as! ForumTableViewCell
        
        var likes = cell.likesLabel.text! as! Int
//
//        cell.nameLabel.text = self.forum?.author
//        cell.multiTextLabel.text = self.forum?.text
//        cell.likesLabel.text = String(self.forum!.likes as! Int)
//
//        if likes > 0 {
//            cell.heartIcon.image = UIImage(named: "like_favorite")
//        } else {
//            cell.heartIcon.image = UIImage(named: "like_not_favorite")
//        }
//
//        //if user is logged in he/she can delete her own post only
//        if cell.nameLabel.text! == userName! {
//            cell.trashIcon.image = UIImage(named: "rubbish-bin")
//
//            //            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete this?", preferredStyle: .alert)
//            //            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            //            self.present(alert, animated: true)
//        } else {
//            cell.trashIcon.image = nil
//        }
        
        return cell
    }
    
    
    


}
