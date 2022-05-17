//
//  ViewController.swift
//  locatebeacon
//
//  Created by elam on 17.05.22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 001, minor: 002, identifier: "mybeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            
            case .far:
                self.view.backgroundColor = .blue
                self.distanceReading.text = "far"
            case .near:
                self.view.backgroundColor = .orange
                self.distanceReading.text = "near"
            case .immediate:
                self.view.backgroundColor = .red
                self.distanceReading.text = "here"
            default:
                self.view.backgroundColor = .gray
                self.distanceReading.text = "unknown"
            }
        }
    }
}




