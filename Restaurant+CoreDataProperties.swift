//
//  Restaurant+CoreDataProperties.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/18.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurant {

    @NSManaged var name: String
    @NSManaged var location: String
    @NSManaged var type: String
    @NSManaged var image: NSData?
    @NSManaged var rating: String?
    @NSManaged var isVisited: NSNumber

}
