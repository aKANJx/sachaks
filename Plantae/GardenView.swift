//
//  GardenView.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI

struct GardenView: View {
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            GardenWrapperView()
            Button(action: {
            }) {
                Image(systemName: "qrcode.viewfinder")
                    .font(.largeTitle)
            }
            .padding(15)
        }
    }
}

struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenView()
    }
}
