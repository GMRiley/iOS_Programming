//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Riley, Kyle M on 2/12/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        segmentedControl.addTarget(self,
        action: #selector(MapViewController.mapTypeChanged(_:)),
        for: .valueChanged)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
         segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
         segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        
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
	
