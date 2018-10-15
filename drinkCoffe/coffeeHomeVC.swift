//
//  coffeeHomeVC.swift
//  drinkCoffe
//
//  Created by Mostafa on 10/5/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import UIKit
import CoreLocation

class coffeeHomeVC: UIViewController , CLLocationManagerDelegate {

    @IBOutlet weak var coffeeFind: UIButton!
    
    let locationManager = CLLocationManager()
    var currentLocation:CLLocationCoordinate2D!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        coffeeFind.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if coffeeFind.isHidden {
            coffeeFind.isHidden = false
        }
        // request location access
        locationManager.requestWhenInUseAuthorization()
        flag = true
    }
    

    // MARK: - Location manager delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // show the activity indicator
        coffeeFind.isHidden = true
        
  
        
        // set a flag so segue is only called once
        if flag {
            currentLocation = locations.last?.coordinate
            locationManager.stopUpdatingLocation()
            flag = false
            print("func\(currentLocation.latitude)")
            performSegue(withIdentifier: "ToCoffeeList", sender: self)
        }
    }
    
  
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the latitude and longitude to the new view controller
        if segue.identifier == "ToCoffeeList" {
            let vc = segue.destination as! CoffeeShopListVC
          //  print("prepare:\(currentLocation.latitude)")

            vc.currentLocation = currentLocation
        }
    }
    
    // MARK: - Helpers
    func showLocationAlert() {
        let alert = UIAlertController(title: "Location Disabled", message: "Please enable location for Mr. Jitters", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
 @objc  func getCurrentLocation() {
        // check if access is granted
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
            default:
                showLocationAlert()
            }
        } else {
            showLocationAlert()
        }
    }
    
    
    
    
  




}

