//
//  CustomTooltip.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct CustomTooltip: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: -1))
        path.addLine(to: CGPoint(x: 10, y: 0))
        path.addLine(to: CGPoint(x: width - 10, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: 10), control: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height - 10))
        path.addQuadCurve(to: CGPoint(x: width - 10, y: height), control: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 10, y: height))
        path.addQuadCurve(to: CGPoint(x: 0, y: height - 10), control: CGPoint(x: 0, y: height))
        path.closeSubpath()
        
        return path
    }
}

struct CustomTooltip_Previews: PreviewProvider {
    static var previews: some View {
        CustomTooltip()
            .fill(Color.gray.opacity(0.9))
            .frame(width: 200, height: 100)
    }
}
