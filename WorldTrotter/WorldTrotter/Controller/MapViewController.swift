//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Noel Maldonado on 9/5/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    //If a view controller is asked for its view and its view is nil, then the loadView() method is called
    override func loadView() {
        //create a map view
        mapView = MKMapView()
        //set it as *the* view of this view controller
        view = mapView
        
        
        //internationalizing strings
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        
        let segmentedControl = UISegmentedControl(items: [standardString,hybridString,satelliteString])
        segmentedControl.backgroundColor = UIColor.systemBackground
        //default map view
        segmentedControl.selectedSegmentIndex = 0
        //needed for user response
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        //turn off default translation *autoresizing masks* an old system for scaling interfaces | conflicts with auto layout
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
    
        //anchors are used to create constraints
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    
    
}
