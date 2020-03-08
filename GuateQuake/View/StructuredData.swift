//
//  StructuredData.swift
//  GuateQuake
//
//  Created by Dakota-Cheyenne Brown on 3/7/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct StructuredData: View {
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
                .shadow(radius: 10)
            
            VStack {
                Text(data.properties.place)
                    .foregroundColor(.gray)
                    .bold()
                
                Text("Time: \(timeConverter(timeStamp: data.properties.time))")
                    .italic()
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 2)
            }
        }
    }
}
