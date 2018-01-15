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
    @IBOutlet weak var lblRating: UILabel!
    
    //custom functions
    func update(place: GMSPlace){
        lblName.text = place.name
        lblLocation.text = place.formattedAddress
        lblRating.text = place.rating.description
        loadFirstPhotoForPlace(placeID: place.placeID)
    }
    func loadFirstPhotoForPlace(placeID: String) {
        GMSPlacesClient.shared().lookUpPhotos(forPlaceID: placeID) { (photos, error) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                if let firstPhoto = photos?.results.first {
                    self.loadImageForMetadata(photoMetadata: firstPhoto)
                }
            }
        }
    }
    
    func loadImageForMetadata(photoMetadata: GMSPlacePhotoMetadata) {
        GMSPlacesClient.shared().loadPlacePhoto(photoMetadata, callback: {
            (photo, error) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                self.imgPlace.image = photo;
            }
        })
    }
}
