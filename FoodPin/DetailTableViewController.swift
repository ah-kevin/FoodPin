//
//  DetailTableViewController.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/14.
//  Copyright © 2016年 柯秉钧. All rights reserved.
///Users/dg_lennon/kevin/ios/learn/FoodPin/FoodPin/DetailTableViewCell.swift

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var retaingBtn: UIButton!
    
    var restaurant:Restaurant!
    @IBOutlet weak var DetailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailImage.image=UIImage(named: restaurant.image)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //背景变白色
        tableView.backgroundColor=UIColor(white: 0.98, alpha: 1)
        
        //移除空行分割线
        tableView.tableFooterView=UIView(frame: CGRectZero)
        //更改分割线颜色
        tableView.separatorColor=UIColor(white: 0.9,alpha: 1)
        
        navigationItem.backBarButtonItem=UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        title=restaurant.name
        tableView.estimatedRowHeight=36;
        tableView.rowHeight=UITableViewAutomaticDimension;
    }
    
//    override func viewDidAppear(animated: Bool) {
  //      self.navigationController?.navigationBar.barStyle = .Black
    //}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailTableViewCell
        cell.backgroundColor=UIColor.clearColor();
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text="餐馆名"
            cell.valueLabel.text=restaurant.name
        case 1:
            cell.fieldLabel.text="类型"
            cell.valueLabel.text=restaurant.type
        case 2:
            cell.fieldLabel.text="地点"
            cell.valueLabel.text=restaurant.location
        case 3:
            cell.fieldLabel.text="是否来过"
            cell.valueLabel.text=restaurant.isVisited ? "来过": "未来过"
        default:
            cell.fieldLabel.text=""
            cell.valueLabel.text=""
        }
        // Configure the cell...

        return cell
    }
    

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

 
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showMap" {
            let destVC=segue.destinationViewController as! MapViewController
            destVC.restaurant = self.restaurant
        }
    }
 
    @IBAction func close(segue:UIStoryboardSegue){
        if let reviewVC=segue.sourceViewController as? RevieweViewController {
            if let rating = reviewVC.rating{
                self.restaurant.rating = rating
                self.retaingBtn.setImage(UIImage(named: rating), forState: .Normal)
            }
        }
    }

}
