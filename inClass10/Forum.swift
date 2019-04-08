//
//  Forum.swift
//  inClass10
//
//  Created by Maria Handschu on 4/7/19.
//  Copyright © 2019 Handschu, Maria. All rights reserved.
//

import Foundation

//class Forums {
//
//    var forums: [String:Any]?
//
//
//    init(_ data: [String:Any]) {
//
//        forums = data
//
//        print("forums \(forums)")
//    }
//
//}

class Forum {
    
    var forums: [String:Any]?
    var myForum: [String:Any]?
    var posts = [Post]()
    
    
    
    init(_ data: [String:Any]) {
        
        forums = data
        myForum = data as [String:Any]
        
        for item in myForum! {

            print ("item \(item)")
            print ("item.value \(item.value)")

            let fd = item.value as! [String:Any]
            posts.append(Post(item.key,
                               fd["author"] as! String,
                               fd["content"] as! String,
                               fd["likes"] as! Int,
                               fd["comment"] as! String))
            
            //self.author = fd["author"]! as? String
            //self.author = fd["author"]! as? String
            //self.author = fd["author"]! as? String
            //self.author = fd["author"]! as? String


        }
        
    }
    
    
    
}

class Post {
    
    var id: String?
    var author: String?
    var text: String?
    var likes: Int?
    var comment: String?

    init (_ id: String?,
          _ author: String?,
          _ text: String?,
          _ likes: Int?,
          _ comment: String?) {
        
        self.author = author
        self.id = id
        self.text = text
        self.likes = likes
        self.comment = comment
        
        
        
    }
}
