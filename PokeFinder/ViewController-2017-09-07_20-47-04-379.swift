//
//  ViewController.swift
//  PokeFinder
//
//  Created by vagelis spirou on 7/9/17.
//  Copyright © 2017 vagelis spirou. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        locationAuthStatus()
    
    }

    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            
            mapView.showsUserLocation = true
        }
    }

    @IBAction func spotRandomPokemon(_ sender: Any) {
    }

}

