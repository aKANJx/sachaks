//
//  VegetableDetailView.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct VegetableDetailView: View {
    var body: some View {
        VStack {
            Text("Radish").font(.largeTitle).bold().padding(15)
            HStack(alignment: .center, spacing: 100) {
                Button(action: {
                }) {
                    Text("Buy for $2")
                        .foregroundColor(Color.white)
                        .font(.headline)
                }
                .padding()
                .background(Color(red: 34/255, green: 139/255, blue: 34/255))
                .cornerRadius(12)
                Button(action: {
                }) {
                    Text("Offer a vegetable")
                        .foregroundColor(Color.white)
                        .font(.headline)
                }
                .padding()
                .background(Color(red: 34/255, green: 139/255, blue: 34/255))
                .cornerRadius(12)
            }
            HStack {
                Image("radish1").resizable()
                Image("radish2").resizable()
            }.cornerRadius(12).frame(width: 300, height: 200, alignment: .center)
            LineView(data: [8,23,54,32,12,37,7,23,43])
                .frame(width: 400, height: 100, alignment: .center)
        }
    }
}

struct VegetableDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableDetailView()
    }
}
