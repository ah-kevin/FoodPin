//
//  Restaurant.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/14.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import Foundation

struct Restaurant1 {
    var name:String
    var type:String
    var location:String
    var image:String
    var isVisited:Bool
    var rating = ""
  
    init(name:String,type:String,location:String,image:String,isVisited:Bool){
        self.name=name
        self.location=location
        self.type=type
        self.image=image
        self.isVisited=isVisited
    }
    
}
