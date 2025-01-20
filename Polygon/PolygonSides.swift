//
//  ContentView.swift
//  Polygon
//
//  Created by Mike Pollard on 25/08/2023.
//

import SwiftUI

struct PolygonSides: View {
    @State private var sides: Double = 6
    private var size: Double = 200

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                Polygon(sides: sides)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.accentColor)
                    .frame(width: size, height: size)
                    .rotationEffect(.degrees(360 / Double(Int(sides)) / 2))
                    .overlay {
                        Text("\(Int(sides))")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                    .padding(.bottom, 64.0)

                Slider(value: $sides, in: 3...16)
                    .padding(.horizontal, 32.0)
            }
        }
    }
}

struct PolygonSides_Previews: PreviewProvider {
    static var previews: some View {
        PolygonSides()
    }
}

