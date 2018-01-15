//
//  PlaceCell.swift
//  WhatToDO
//
//  Created by Tiago Do Couto on 1/15/18.
//  Copyright © 2018 Tiago Do Couto. All rights reserved.
//

import UIKit
import GooglePlaces

class PlaceCell: UITableViewCell {
    //outlets
    @IBOutlet weak var imgPlace: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    //custom functions
    func update(place: GMSPlace){
        lblName.text = place.name
        lblLocation.text = place.formattedAddress
    }
}
