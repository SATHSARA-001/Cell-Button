//
//  AnnotationsApple.swift
//  Map
//
//  Created by Sathsara Maduranga on 6/24/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import UIKit
import GoogleMaps
import EMResourcer



class AnnotationsApple: UIViewController {
    
    @IBOutlet weak var all: GMSMapView!
    
    
    var place: [Place] = []
    var mapView = GMSMapView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCurrentLocationOnMap()
        
    }
    
    func showCurrentLocationOnMap(){
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        let camera = GMSCameraPosition.camera(withLatitude: 6.8972087, longitude: 79.8555767, zoom: 14.0) //Set default lat and long
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        
        for data in place{
            let location = CLLocationCoordinate2D(latitude: data.latitude!, longitude: data.longitude!)
            print("location: \(location)")
            let marker = GMSMarker()
            marker.position = location
            marker.snippet = data.title
            marker.map = mapView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.showCurrentLocationOnMap()
        // self.locationManager.stopUpdatingLocation()
    }
    
    
    
    
    
}
