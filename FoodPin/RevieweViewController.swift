//
//  RevieweViewController.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/15.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit

class RevieweViewController: UIViewController {
    
    var rating: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBAction func ratingBtnTapped(sender: UIButton) {
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "great"
        default:
            break
        }
        
        performSegueWithIdentifier("UnwindToDetail", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect=UIBlurEffect(style: .Light)
        let effectView=UIVisualEffectView(effect: blurEffect)
        
        effectView.frame=view.frame
        
        imageView.addSubview(effectView)
        
        
        let scale = CGAffineTransformMakeScale(0,0);
        //let tranlate = CGAffineTransformMakeTranslation(0,500);
        ratingStackView.transform = scale

     
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(0.3) {
//            self.ratingStackView.transform=CGAffineTransformIdentity
//        }
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.ratingStackView.transform=CGAffineTransformIdentity
            }, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
