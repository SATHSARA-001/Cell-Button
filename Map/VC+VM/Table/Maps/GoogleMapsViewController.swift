//
//  GoogleMapsViewController.swift
//  Map
//
//  Created by Sathsara Maduranga on 6/23/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import UIKit
import GoogleMaps
import EMResourcer

class GoogleMapsViewController: UIViewController,GMSMapViewDelegate,GoogleMapsDirectionsDelegate {
    
    
    
    @IBOutlet weak var customMapView: GMSMapView!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
    
    func setupMap(){
        
        let longitude =  place?.longitude ?? 0.00
        let latitude = place?.latitude ?? 0.00
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude , longitude: longitude, zoom: 50.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.map = mapView
    }
    
}
