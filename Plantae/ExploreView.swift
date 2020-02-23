//
//  CommunityView.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI

struct ExploreView: View {
    
    @State var vegetables = [
        Vegetable(name: "Carrot", nickname: "Carromon", coordinate: .init(latitude: 38.76078, longitude: -121.5890)),
        Vegetable(name: "Radish", nickname: "Radishmon", coordinate: .init(latitude: 38.16078, longitude: -121.2890))]
    var body: some View {
        MapView(vegetables: $vegetables)
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
