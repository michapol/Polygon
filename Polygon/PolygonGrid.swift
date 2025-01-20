//
//  ContentView.swift
//  Polygon
//
//  Created by Mike Pollard on 25/08/2023.
//

import SwiftUI

struct PolygonGrid: View {
    private let sides: Double = 6
    private var size: Double = 120
    private var spacing: Double = -15
    private let colours: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    private let columns = 6
    private let numberOfShapes = 60

    private func isAltRow(item: Int, columns: Int) -> Bool {
        item / columns % 2 == 1
    }

    private func gridItems(number: Int) -> [GridItem] {
        Array(repeating: GridItem(.fixed(size), spacing: size - 120 + spacing, alignment: .top), count: number)
    }

    private func scaleAmount() -> CGFloat {
        return 1.0
    }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    LazyVGrid(columns: gridItems(number: columns), alignment: .center, spacing: 120 - size) {
                        ForEach(0..<numberOfShapes, id: \.self) { value in
                            let colour = colours.randomElement()
                            Polygon(sides: sides)
                                .stroke(lineWidth: 3.0)
                                .foregroundColor(colour)
                                .frame(width: size, height: size, alignment: .center)
                                .rotationEffect(.degrees(360 / Double(Int(sides)) / 2))
                                .overlay {
                                    Text("\(value)")
                                        .font(.some(.title))
                                        .foregroundColor(colour)
                                }
                                .scaleEffect(
                                    x: scaleAmount(),
                                    y: scaleAmount(),
                                    anchor: .center
                                )
                                .offset(
                                    x: 0,
                                    y: Double(value % columns % 2) * (size / 2)
                                )
                        }
                    }
                    .padding(.bottom, size / 2)
                }
            }
        }
    }
}

struct PolygonGrid_Previews: PreviewProvider {
    static var previews: some View {
        PolygonGrid()
    }
}

