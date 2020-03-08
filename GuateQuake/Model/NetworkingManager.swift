//
//  NetworkingManager.swift
//  GuateQuake
//
//  Created by Dakota-Cheyenne Brown on 3/7/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import Foundation

class NetworkingManager: ObservableObject {
    
    @Published var dataList = QuakeAPIList(features: [])
    
    init() {
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.geojson") else {return}
        
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            guard let urlData = data else {return}
            
            let urlDataList = try! JSONDecoder().decode(QuakeAPIList.self, from: urlData)
            
            for data in urlDataList.features {
                if ((data.geometry.coordinates[1] >= 8.000000 && data.geometry.coordinates[1] <= 24.000000) && (data.geometry.coordinates[0] <= -84.000000 && data.geometry.coordinates[0] >= -100.000000)) {
                    DispatchQueue.main.async {
                        self.dataList.features.append(data)
                    }
                }
                
            }
        }.resume()
    }
}
