//
//  ContentView.swift
//  Polygon
//
//  Created by Mike Pollard on 25/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                PolygonSides()
                    .tabItem {
                        Label("Sides", systemImage: "hexagon")
                    }
                PolygonGrid()
                    .tabItem {
                        Label("Grid", systemImage: "circle.hexagongrid")
                    }
            }
            .toolbarBackground(.black, for: .tabBar)
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
