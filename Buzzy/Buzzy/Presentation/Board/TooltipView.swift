//
//  TooltipView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct TooltipView: View {
    let text: String
    
    public var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding(8)
            .frame(width: 180)
            .background(CustomTooltip().fill(Color.gray.opacity(0.9)))
    }
}

struct TooltipView_Previews: PreviewProvider {
    static var previews: some View {
        TooltipView(text: "This is a tooltip")
    }
}
