//
//  ApiService.swift
//  TestSampleProject
//
//  Created by Manikandan on 17/12/22.
//

import UIKit

class ApiService {

    static let sharedInstance = ApiService()

    private init() {}

    //MARK: Location History API's
        
    func getDataFromServer(cityName:String, complete: @escaping (_ success: Bool, _ data: LocationListModal? )->() ) {

        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=522db6a157a748e2996212343221502&q=\(cityName)&days=7&aqi=no&alerts=no") else   {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                return
            }
            do {
                let usermodel = try JSONDecoder().decode(LocationListModal.self, from: data)
                    print(usermodel)
                complete(true, usermodel)
                
            } catch {
                
            }

        }
        task.resume()
            
}
}
  

   


