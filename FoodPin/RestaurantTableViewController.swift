//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/11.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit
import CoreData
class RestaurantTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {
    var resraurants:[Restaurant]=[]
    var frc :NSFetchedResultsController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //更改返回按钮
        navigationItem.backBarButtonItem=UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight=80;
        tableView.rowHeight=UITableViewAutomaticDimension;
        
        let request = NSFetchRequest(entityName: "Restaurant")
        request.sortDescriptors = [NSSortDescriptor(key:"name", ascending: true)]
        
        let  buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: buffer!, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        do{
            try frc.performFetch()
            resraurants = frc.fetchedObjects as! [Restaurant]
        }catch{
            print(error)
        }
    }

    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _newindexPath = newIndexPath{
                tableView.insertRowsAtIndexPaths([_newindexPath], withRowAnimation: .Automatic)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Update:
            if let _indexPath = indexPath{
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        default:
            tableView.reloadData()
        }
        
    resraurants = controller.fetchedObjects as! [Restaurant]
    }
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
        return resraurants.count
    }
    
    //选择了行以后的操作
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let alert=UIAlertController(title: "亲,您选着了我", message: "消息", preferredStyle:UIAlertControllerStyle.ActionSheet)
//        
//        let cancelaction=UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
//        
//        let call={(action:UIAlertAction)->Void in
//            let alert=UIAlertController(title: "提示", message: "您拨打的电话号码无法接通", preferredStyle:.Alert)
//            let action=UIAlertAction(title: "ok", style: .Default, handler: nil)
//            alert.addAction(action)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
//        
//        let dialAction=UIAlertAction(title: "拨打 021-6531-\(indexPath.row)", style: .Default, handler: call)
//        
//        
//        let mecan = UIAlertAction(title: "我来过", style: .Default) { (_) in
////            let cell=tableView.cellForRowAtIndexPath(indexPath)
////            cell?.accessoryType=UITableViewCellAccessoryType.Checkmark
//            
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell;
//            cell.heart.hidden = false;
//            self.editshop[indexPath.row]=true;
//        }
//        
//        alert.addAction(cancelaction)
//        alert.addAction(dialAction);
//        alert.addAction(mecan);
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
            //         cell.textLabel?.text=eatshop[indexPath.row]
            //         cell.imageView?.image=UIImage(named: shopimg[indexPath.row])
        cell.restaurantImage.image=UIImage(data: resraurants[indexPath.row].image!)
        cell.restaurantName.text=resraurants[indexPath.row].name
        cell.restaurantImage.layer.cornerRadius=cell.restaurantImage.frame.size.width/2;
        cell.restaurantImage.clipsToBounds=true;
        
        cell.heart.image=UIImage(named: "heart.png");
        cell.heart.hidden=true;
        if resraurants[indexPath.row].isVisited.boolValue{
            cell.heart.hidden = false
        }else{
            cell.heart.hidden = true
        }


        cell.restaurantType.text=resraurants[indexPath.row].type;
        cell.location.text=resraurants[indexPath.row].location;
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /*
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            eatshop.removeAtIndex(indexPath.row);
            shopimg.removeAtIndex(indexPath.row);
            eatlocation.removeAtIndex(indexPath.row);
            eattype.removeAtIndex(indexPath.row);
            editshop.removeAtIndex(indexPath.row);
            //tableView.reloadData();
    
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
*/
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction=UITableViewRowAction(style: .Default, title: "分享") { (action, indexPath) in
            let alert=UIAlertController(title: "分享到", message: "请选择你要分享的社交类型", preferredStyle: .ActionSheet)
            let qqAction=UIAlertAction(title: "qq", style: .Default, handler: nil)
             let sianAction=UIAlertAction(title: "sina", style: .Default, handler: nil)
             let wxAction=UIAlertAction(title: "微信", style: .Default, handler: nil)
            alert.addAction(qqAction);
            alert.addAction(sianAction);
            alert.addAction(wxAction);
            self.presentViewController(alert,animated: true,completion:nil)
        }
        shareAction.backgroundColor=UIColor(red: 218/255, green: 225/255, blue: 218/255, alpha: 1)
        let delete=UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) -> Void in
            //self.resraurants.removeAtIndex(indexPath.row);
            // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
            let restaurantTodel = self.frc.objectAtIndexPath(indexPath) as! Restaurant
            buffer?.deleteObject(restaurantTodel)
            
            do{
                try buffer?.save()
            }catch{
            print(ErrorType)
            }

        }
        return [shareAction,delete];
    }

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
        if segue.identifier=="showRestaurantDetail"{
                let destVC=segue.destinationViewController as! DetailTableViewController
            
            destVC.restaurant=resraurants[(tableView.indexPathForSelectedRow!.row)]
        }
    
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue){
    
    }
    
    
 

}
