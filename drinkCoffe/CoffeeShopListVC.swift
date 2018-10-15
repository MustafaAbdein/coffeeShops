//
//  CoffeeShopListVC.swift
//  drinkCoffe
//
//  Created by Mostafa on 10/5/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class CoffeeShopListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    let client_id = "5TPJM5C1M4L14XJIDKLI3TUOMDHGWHKRBMK2DJGTXFFRCIV2"
    let client_secret = "IASAR1YXE3ZU1HCHVOJLBVNW2N5AUK3SU53P4FFRK2YDB1FY"
    var coffeeShops : coffeeShopGet!
    @IBOutlet weak var table: UITableView!
     var searchResults = [Result]()
    var currentLocation : CLLocationCoordinate2D!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("latitude:\(currentLocation.latitude)")
        print(currentLocation.longitude)
        searchForCoffee(){}
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VenueCell
        
        cell.titleLB.text = searchResults[indexPath.row].venue.name
        cell.addressLB.text = searchResults[indexPath.row].venue.location.address
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let latitude:CLLocationDegrees = searchResults[indexPath.row].venue.location.lat
        let longitude:CLLocationDegrees = searchResults[indexPath.row].venue.location.lng
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionspan = MKCoordinateRegionMakeWithDistance(coordinates, 1000, 1000)
        
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionspan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionspan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name =  searchResults[indexPath.row].venue.name

            mapItem.openInMaps(launchOptions: options)
    
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func searchForCoffee(completed : @escaping () -> ()){
        
       guard let url = URL(string: "https://api.foursquare.com/v2/search/recommendations?ll=\(currentLocation.latitude),\(currentLocation.longitude)&v=20160607&intent=coffee&limit=15&client_id=\(client_id)&client_secret=\(client_secret)") else {return}
      
        URLSession.shared.dataTask(with: url) { (data, success, error) in
            
            if error == nil{
                
                do{
                    
                   self.coffeeShops = try JSONDecoder().decode(coffeeShopGet.self, from: data!)
                    
                      self.searchResults =  self.coffeeShops.response.group.results
                    //["response"]["group"]["results"].arrayValue
                    completed()
                    
                    DispatchQueue.main.async {
                        print (self.coffeeShops)
                        self.table.reloadData()
                     
                    }
                    
                }catch let error {
                    print("catcherr: \(error)")
                }
                
            }
            
            
            }.resume()
        
        
    }

 

}
