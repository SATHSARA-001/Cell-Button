//
//  AppleMapsViewController.swift
//  Map
//
//  Created by Sathsara Maduranga on 6/23/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import UIKit
import MapKit
import EMResourcer


class AppleMapsViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var btnDirection: UIButton!
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    @IBAction func clickOnDirection(_ sender: UIButton) {
        
        //  showDirectionsOnAppleMapView(place: self.place)
        
    }
    
    
    
    
    func setupUI(){
        
        let longitude =  place?.longitude ?? 0.00
        let latitude = place?.latitude ?? 0.00
        //Add pin annotations to map
        let location = CLLocationCoordinate2D(latitude: latitude,longitude:longitude)
        let placeMark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let annotation = MKPointAnnotation()
        annotation.title = self.place?.title
        annotation.subtitle = self.place?.address
        if let location = placeMark.location {
            annotation.coordinate = location.coordinate
            self.mapView.showAnnotations([annotation], animated: true)
        }
    }
    
}

private extension MKMapView {
    func centerToLocation(_ location: CLLocation,regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius,longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

extension UIViewController: MKMapViewDelegate{
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //find annotation for identifier
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation") as? MKPinAnnotationView
        //create annotation if not available
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.isEnabled = true
        annotationView?.canShowCallout = true
        return annotationView
    }
}


