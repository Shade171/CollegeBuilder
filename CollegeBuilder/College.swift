//
//  College.swift
//  CollegeBuilder
//
//  Created by cstark on 1/21/16.
//  Copyright © 2016 cstark. All rights reserved.
//

import UIKit

class College: NSObject
{
 var name = ""
 var location = ""
 var numberofStudents = 0
 var image = UIImage(named: "Default")
    init(Name: String, Location: String, Numberofstudents: Int, Image:UIImage)
    {
     name = Name
     location = Location
     numberofStudents = Numberofstudents
     image = Image
    }
    init(Name:String, Location: String)
    {
     name = Name
     location = Location
    }
}
