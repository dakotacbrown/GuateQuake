//
//  CellRow.swift
//  GuateQuake
//
//  Created by Dakota-Cheyenne Brown on 3/7/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    var data: Features
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            VStack(alignment: .leading) {
                if data.properties.mag >= -1 && data.properties.mag < 4.5 {
                    VStack {
                        Text(String(data.properties.mag))
                            .bold().foregroundColor(.white)
                            .font(.headline)
                    }.frame(width:100, height: 100)
                        .background(Color.green)
                }
                else if data.properties.mag >= 4.5 && data.properties.mag < 5.5 {
                    VStack {
                        Text(String(data.properties.mag))
                            .bold().foregroundColor(.white)
                            .font(.headline)
                    }.frame(width:100, height: 100)
                        .background(Color.yellow)
                }
                else if data.properties.mag >= 5.5 && data.properties.mag < 6.5 {
                    VStack {
                        Text(String(data.properties.mag))
                            .bold().foregroundColor(.white)
                            .font(.headline)
                    }.frame(width:100, height: 100)
                        .background(Color.orange)
                }
                else {
                    VStack {
                        Text(String(data.properties.mag))
                            .bold().foregroundColor(.white)
                            .font(.headline)
                    }.frame(width:100, height: 100)
                        .background(Color.red)
                }
                
            }.clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 5)
            
            VStack {
                Text(data.properties.place)
                    .bold()
                
                Text("Fecha: \(timeConverter(timeStamp: data.properties.time))")
                    .italic()
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 2)
            }
        }
    }
}
    
    
    /*
     Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
     09/12/2018                        --> MM/dd/yyyy
     09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
     Sep 12, 2:11 PM                   --> MMM d, h:mm a
     September 2018                    --> MMMM yyyy
     Sep 12, 2018                      --> MMM d, yyyy
     Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
     2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
     12.09.18                          --> dd.MM.yy
     10:41:02.112                      --> HH:mm:ss.SSS
     */
    
    func timeConverter(timeStamp: Double) -> String {
        let unixTimestamp = timeStamp / 1000 //to get milliseconds
        let date = Date(timeIntervalSince1970: unixTimestamp)
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "MM.dd.yy, hh:mm a"
        
        return dateFormatter.string(from: date)
}
