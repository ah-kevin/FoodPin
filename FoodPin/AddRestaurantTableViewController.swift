//
//  AddRestaurantTableViewController.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/16.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit
import CoreData
class AddRestaurantTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var restaurant : Restaurant!
    var isVisited = false
  
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var location: UITextField!
    @IBAction func isVisitedTapped(sender: UIButton) {
        if sender.tag == 8001{
            isVisited = true
            LAbelVisted.text = "我来过了"
        }else{
            isVisited = false
            LAbelVisted.text = "我没来过"
        }
    }
    @IBOutlet weak var LAbelVisted: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var type: UITextField!
    
    @IBAction func SavaBtnTapped(sender: UIBarButtonItem) {
        let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        let restaurant=NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: buffer!) as! Restaurant
        restaurant.name = name.text!
        restaurant.type = type.text!
        restaurant.location = location.text!
        
        if let image = imageview.image{
            restaurant.image = UIImagePNGRepresentation(image)
        }
        restaurant.isVisited = isVisited
        
        do {
            try buffer?.save()
        }catch{
            print(error)
        }
        performSegueWithIdentifier("unwindTohomeList", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                  imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageview.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageview.contentMode = .ScaleAspectFill
        imageview.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    /*
    ove
     rride func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
