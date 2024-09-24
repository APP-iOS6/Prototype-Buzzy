//
//  TooltipButton.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct TooltipButton: View {
    @Binding var showTooltip: Bool
    let updatePosition: (CGPoint) -> Void
    
    public var body: some View {
        Button(action: { withAnimation { showTooltip.toggle() } }) {
            Image(systemName: "info.circle")
                .foregroundColor(Color.gray.opacity(0.7))
        }
        .background(GeometryReader { geometry in
            Color.clear.preference(key: ButtonPositionKey.self,
                                   value: geometry.frame(in: .global).origin)
        })
        .onPreferenceChange(ButtonPositionKey.self, perform: updatePosition)
    }
}

public struct ButtonPositionKey: PreferenceKey {
    public static var defaultValue: CGPoint = .zero
    public static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}

struct TooltipButton_Previews: PreviewProvider {
    static var previews: some View {
        TooltipButton(showTooltip: .constant(false), updatePosition: { _ in })
    }
}
