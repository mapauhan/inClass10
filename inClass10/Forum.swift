//
//  Forum.swift
//  inClass10
//
//  Created by Maria Handschu on 4/7/19.
//  Copyright © 2019 Handschu, Maria. All rights reserved.
//

import Foundation

class Forum {
    
    var forums: [String:Any]?
    var myForums: [String:Any]?
    var posts = [Post]()
    
    var author: String?
    var text: String?
    var likes: Int?
    var comment: String?
    
    
    init(_ data: [String:Any]) {
        
        myForums = data as [String:Any]
        
        for item in myForums! {
            print("item value \(item.value)") //prints each forum 
            
            let fd = item.value as! [String:Any]
            posts.append(Post(item.key,
                              (fd["author"] as! String),
                              (fd["content"] as! String),
                              (fd["likes"] as! Int),
                              (fd["comment"] as! String)))
            
        }
        
    }
}


class Post {
    
    var author: String?
    var text: String?
    var likes: Int?
    var comment: String?
    var id: String?
    
    init(_ id: String?, _ author: String?, _ text: String?, _ likes: Int?, _ comment: String?) {
        
        self.author = author
        self.text = text
        self.id = id
        self.likes = likes
        self.comment = comment
        
    }
}
