//
//  DataViewModal.swift
//  TestSampleProject
//
//  Created by Manikandan on 17/12/22.
//

import UIKit

class LocationListViewModal {
    
    var locationList: LocationListModal?
    var reloadTableView: (()->())?
    var movieModal: LocationListModal?
    var totala: LocationListModal?

    func getData(city:String){
        ApiService.sharedInstance.getDataFromServer(cityName: city) { (success, data) in
            if success {
                self.locationList = data
                self.reloadTableView?()
                
            } else {
                print("Ups, something went wrong.")
            }
        }
    }}
