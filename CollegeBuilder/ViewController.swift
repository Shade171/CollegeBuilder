//
//  ViewController.swift
//  CollegeBuilder
//
//  Created by cstark on 1/20/16.
//  Copyright © 2016 cstark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var college: [College] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        college.append(College(Name: "Princeton", Location: "New Jersey", Numberofstudents: 5391, Image:UIImage(named: "Princeton")!))
        college.append(College(Name: "Harvard", Location: "Massachusetts", Numberofstudents: 6694, Image: UIImage(named: "Harvard")!))
        college.append(College(Name: "Yale", Location: "Connecticut", Numberofstudents: 5477, Image: UIImage(named: "Yale")!))
        college.append(College(Name: "Columbia", Location: "NYC", Numberofstudents: 6170, Image: UIImage(named: "Columbia")!))
        
    }
    @IBAction func editButtonTapped(sender: AnyObject)
    {
        myTableView.editing = !myTableView.editing
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title:"Add College" , message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default){ (addAction) -> Void in
        let collegeNameTextField = myAlert.textFields![0] as UITextField
        let collegeLocationTextField = myAlert.textFields![1]
            self.college.append(College(Name: collegeNameTextField.text!, Location: collegeLocationTextField.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler{(collegeNameTextField) -> Void in
            collegeNameTextField.placeholder = "add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler{(collegeLocationTextField) -> Void in
            collegeLocationTextField.placeholder = "add College Location"
        }
            self.presentViewController(myAlert, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            college.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
      return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
      let selectedCollege = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(selectedCollege, atIndex: destinationIndexPath.row)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = college[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = college[indexPath.row].location
        return myTableViewCell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return college.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
      let detailVC = segue.destinationViewController as! DetailViewController
      let selectRow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = college[selectRow!]
    }
}