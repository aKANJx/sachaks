//
//  ContentView.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem({
                    Image("compass.fill")
                    Text("Explore")
                })
            GardenView()
                .tabItem({
                    Image("garden.fill")
                    Text("My Garden")
                })
        }
        .accentColor(Color(red: 34/255, green: 139/255, blue: 34/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
