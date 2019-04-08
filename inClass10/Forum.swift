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
    var myData: Data1?
    
    var author: String?
    var text: String?
    var likes: Int?
    var comment: String?
    
    
    init(_ data: [String:Any]) {
        
        myData = Data1(data)
        
        //print ("myData\(myData)")
        
        
        print(type(of: data))

        
        
        //or item in myData {
        
            //print(type(of: ))
            
//            let thePost = item
//
//            self.author = (thePost["author"] as! String)
//            self.text = (thePost["content"] as! String)
//            self.likes = (forums["likes"] as! Int)
//            self.comment = (forums["comment"] as! String)
            
        //}
        
        //let forumData = data["/"]
        
        

        
    }
    
    
    
}

class Data1 {

    var author: String?
    var text: String?
    var likes: Int?
    var comment: String?
    
    init(_ forumData: [String:Any]){

        //let forumData2 = forumData["/"] as? [String:Any]
        for forumData2  in forumData {
            
            let fd = forumData2
            //let f = fd["-LbtPZ7m7oIvIRxZiefT"]
            
            //self.author = f.author
            
            
            
            
            print (fd)
            
//            self.author = (forumData2["author"] as! String)
//            self.text = (forumData2["content"] as! String)
//        self.likes = (forumData2?["likes"] as! Int)
//        self.comment = (forumData2?["comment"] as! String)

            //print (forumData2)
        }
    }
}
