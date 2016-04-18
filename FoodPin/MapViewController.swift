//
//  MapViewController.swift
//  FoodPin
//
//  Created by 柯秉钧 on 16/4/15.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    var restaurant: Restaurant!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        mapView.showsTraffic = true
        mapView.showsUserLocation=true
        mapView.showsCompass=true
        mapView.showsScale=true
        mapView.showsBuildings=true
        
        //地址转换
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) {
            (plackmarks, error) in
            if error != nil {
                print(error)
                return
            }
            if let plackmarks = plackmarks {
                let plackmark = plackmarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                if let location = plackmark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation,animated:true)
                }
                
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        let id = "我的图钉"
        if annotation is MKUserLocation {
            return nil
        }
        
        var  annatationView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        if annatationView == nil {
            annatationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annatationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        imageView.image = UIImage(data: restaurant.image!)
        
        annatationView?.leftCalloutAccessoryView = imageView
        return annatationView
        
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
