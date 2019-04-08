//
//  NewForumViewController.swift
//  inClass10
//
//  Created by Handschu, Maria on 4/3/19.
//  Copyright © 2019 Handschu, Maria. All rights reserved.
//

import UIKit
import Firebase


class NewForumViewController: UIViewController {
    
    var userName: String?
    @IBOutlet weak var forumText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        let ref = Database.database().reference()
        
        
        if forumText.text == nil || forumText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Missing text", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            ref.childByAutoId().setValue(["author": userName, "content": forumText.text!, "likes": 0, "comment": "this is a test"])
            
            
        }
        
        performSegue(withIdentifier: "returnToList", sender: nil)
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
    }
    
}



