//
//  Hexagon.swift
//  Polygon
//
//  Created by Mike Pollard on 25/08/2023.
//

import SwiftUI

struct Polygon: Shape {
    let sides: Double

    func path(in rect: CGRect) -> Path {
        let relativePoints = calculateRelativePoints(segments: Int(sides))
        var scaledPoints = scale(points: relativePoints, rect: rect)
        let firstPoint = scaledPoints.remove(at: 0)

        var path = Path()
        path.move(to: firstPoint)

        scaledPoints.forEach { point in
            path.addLine(to: point)
        }

        return path
    }

    private func calculateRelativePoints(segments: Int) -> [CGPoint] {
        var points = [CGPoint]()

        let angle = Double.pi * 2 / Double(segments)
        for segment in 0...segments {
            let segmentAngle = Double(segment) * angle
            let x = sin(segmentAngle)
            let y = cos(segmentAngle)
            points.append(CGPoint(x: x, y: y))
        }

        return points
    }

    private func scale(points: [CGPoint], rect: CGRect) ->[CGPoint] {
        let shortestSideRadius = rect.width < rect.height ? rect.width / 2 : rect.height / 2
        var scaledPoints = [CGPoint]()

        for point in points {
            let x = (point.x + 1) * shortestSideRadius
            let y = (point.y + 1) * shortestSideRadius
            scaledPoints.append(CGPoint(x: x, y: y))
        }

        return scaledPoints
    }
}
