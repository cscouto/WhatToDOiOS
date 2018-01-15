//
//  ViewController.swift
//  WhatToDO
//
//  Created by Tiago Do Couto on 1/15/18.
//  Copyright © 2018 Tiago Do Couto. All rights reserved.
//

import UIKit
import GooglePlaces

class PlacesVC: UIViewController {
    //outlets
    @IBOutlet weak var tableView: UITableView!
    
    //vars
    var placesClient: GMSPlacesClient!
    let locationManager = CLLocationManager()
    var places: [GMSPlaceLikelihood]?
    
    //class functions
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()
        locationManager.requestWhenInUseAuthorization()
        getNearbyPlaces()
    }
    
    //custom functions
    func getNearbyPlaces(){
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            if let placeLikelihoodList = placeLikelihoodList {
                self.places = placeLikelihoodList.likelihoods
                self.tableView.reloadData()
            }
        })
    }
}

extension PlacesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places != nil ? places!.count : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        let place = places![indexPath.row].place
        cell.update(place: place)
        return cell
    }
}
