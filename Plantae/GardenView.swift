//
//  GardenView.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI
import CodeScanner

struct GardenView: View {
    
    @State private var scannerShown = false
    @State var vegetables = [Vegetable]()
    
    var body: some View {
        ZStack {
            GardenWrapperView(vegetables: $vegetables)
            VStack(alignment: .center, spacing: 20) {
                Button(action: {
                    self.scannerShown = true
                }) {
                    Image(systemName: "qrcode.viewfinder")
                        .resizable().frame(width: 40, height: 40, alignment: .center)
                }.padding(30)
                Text("Scan a Plantae box to add a new vegetable to your garden").font(.headline).multilineTextAlignment(.center)
            }.opacity(vegetables.count>0 ? 0 : 1)
        }
        .sheet(isPresented: $scannerShown) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Test", completion: self.handleScan(result:))
        }
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
       self.scannerShown = false
        vegetables.append(Vegetable(name: "Radish", nickname: "", coordinate: .init(latitude: 30, longitude: 30)))
    }
}

struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenView()
    }
}
