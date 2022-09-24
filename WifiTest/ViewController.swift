//
//  ViewController.swift
//  WifiTest
//
//  Created by Hussein Anwar on 23/09/2022.
//

import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{
    
    let service = WiFiInfoService()

    var manager:CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .restricted,.denied,.notDetermined:
            // report error, do something
            print("error")
        default:
            // location si allowed, start monitoring
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        manager.stopUpdatingLocation()
        // do something with the error
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let minAllowedAccuracy : CLLocationAccuracy = 100.0
        if let locationObj = locations.last {
            if locationObj.horizontalAccuracy < minAllowedAccuracy {
                manager.stopUpdatingLocation()
                // report location somewhere else
            }
        }
    }
    
    func getInfo(){
        if let info = service.getWiFiInfo() {
            // do something with data
            print("INFO IS : \(info) " )
        } else {
            // present alert
            print("INFO IS NOT HERE :( " )
        }
    }
    
    
    @IBAction func getInfoAction(_ sender: UIButton) {
        getInfo()
    }
}


