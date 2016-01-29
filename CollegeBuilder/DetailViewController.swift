//
//  DetailViewController.swift
//  CollegeBuilder
//
//  Created by cstark on 1/26/16.
//  Copyright © 2016 cstark. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    var college: College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        numberOfStudentsTextField.text = String(college.numberofStudents)
        myImageView.image = college.image
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberofStudents = Int(numberOfStudentsTextField.text!)!
        college.image = myImageView.image
    }
    
}
