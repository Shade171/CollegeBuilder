//
//  DetailViewController.swift
//  CollegeBuilder
//
//  Created by cstark on 1/26/16.
//  Copyright © 2016 cstark. All rights reserved.
//

import UIKit
import SafariServices
class DetailViewController: UIViewController,SFSafariViewControllerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    var college: College!
    let myImagePicker = UIImagePickerController()
    var myPhotos: [UIImage] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        numberOfStudentsTextField.text = String(college.numberofStudents)
        myImageView.image = college.image
        websiteTextField.text = college.website
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
    }
    
    @IBAction func changeImageButtonTapped(sender: UIButton)
    {
        let mySheet = UIAlertController(title: "add from...", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        mySheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler:{ (libraryAction) -> Void in
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.myImagePicker, animated: true, completion: nil)
        }))
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            mySheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler:{ (cameraAction) -> Void in
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)}))
        }
        presentViewController(mySheet, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true) {() -> Void in
            self.college.image = (info[UIImagePickerControllerEditedImage]as! UIImage)
            self.myImageView.image = (info[UIImagePickerControllerEditedImage]as! UIImage)
        }
    }

    @IBAction func websiteButtonTapped(sender: UIButton)
    {
     let myUrl = NSURL(string:"https://" + "\(websiteTextField.text!)")
     let svc = SFSafariViewController(URL: myUrl!)
     svc.delegate = self
     presentViewController(svc, animated:true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
      controller.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberofStudents = Int(numberOfStudentsTextField.text!)!
        college.image = myImageView.image
        college.website = websiteTextField.text!
    }
    
}
