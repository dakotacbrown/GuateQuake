//
//  QuakeDetails.swift
//  GuateQuake
//
//  Created by Dakota-Cheyenne Brown on 3/7/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
import MapKit

struct QuakeDetails: View {
    var data: Features
    var body: some View {
        ZStack(alignment: .top) {
            MapView(data: data)
                .edgesIgnoringSafeArea(.all)
            
            if data.properties.mag >= -1 && data.properties.mag < 4.5 {
                VStack(alignment: .center, spacing: 6) {
                    Text(String(data.properties.mag))
                        .font(.largeTitle)
                    
                    Text(data.properties.place)
                    
                }.clipShape(Rectangle())
                    .frame(width:nil, height: nil)
                    .padding(.all, 20)
                    .background(Color.green)
                    .shadow(radius: 8)
                .cornerRadius(8)
                    .opacity(0.8)
            }
            else if data.properties.mag >= 4.5 && data.properties.mag < 5.5 {
                VStack(alignment: .center, spacing: 6) {
                    Text(String(data.properties.mag))
                        .font(.largeTitle)
                    
                    Text(data.properties.place)
                    
                }.clipShape(Rectangle())
                    .frame(width:nil, height: nil)
                    .padding(.all, 20)
                    .background(Color.yellow)
                    .shadow(radius: 8)
                .cornerRadius(8)
                    .opacity(0.8)
            }
            else if data.properties.mag >= 5.5 && data.properties.mag < 6.5 {
                VStack(alignment: .center, spacing: 6) {
                    Text(String(data.properties.mag))
                        .font(.largeTitle)
                    
                    Text(data.properties.place)
                    
                }.clipShape(Rectangle())
                    .frame(width:nil, height: nil)
                    .padding(.all, 20)
                    .background(Color.orange)
                    .shadow(radius: 8)
                .cornerRadius(8)
                    .opacity(0.8)
            }
            else {
                VStack(alignment: .center, spacing: 6) {
                    Text(String(data.properties.mag))
                        .font(.largeTitle)
                    
                    Text(data.properties.place)
                    
                }.clipShape(Rectangle())
                    .frame(width:nil, height: nil)
                    .padding(.all, 20)
                    .background(Color.red)
                    .shadow(radius: 8)
                .cornerRadius(8)
                    .opacity(0.8)
            }
        }
    }
}
