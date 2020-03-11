//
//  ContentView.swift
//  GuateQuake
//
//  Created by Dakota-Cheyenne Brown on 3/7/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    var body: some View {
        NavigationView {
            List(networkingManager.dataList.features, id: \.properties) { data in
                NavigationLink(destination: QuakeDetails(data: data)) {
                    CellRow(data: data)
                }.navigationBarTitle("GuateQuakes")
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
