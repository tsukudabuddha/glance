//
//  Network.swift
//  glance
//
//  Created by Andrew Tsukuda on 1/20/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    func getShows(keyword: String, completion: @escaping ([Show]) -> Void) {
        let parameters: Parameters = ["q": keyword]
        let urlString = "http://api.tvmaze.com/search/shows"
        print("url: \(urlString)")
        let Url = URL(string: urlString)!
    
        
        Alamofire.request(Url, method: .get, parameters: parameters).responseJSON { (response) in
            if let data = response.data {
                let shows = try? JSONDecoder().decode([Show].self, from: data)
                print(response.debugDescription)
                
                if let shows = shows {
                    completion(shows)
                } else {
                    print("trip: \(data.description)")
                }
            }
        }
    }
}
