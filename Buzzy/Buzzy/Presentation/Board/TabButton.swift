//
//  TabButton.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.semibold20)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundColor(isSelected ? .white : Color.accentColor)
                .background(isSelected ? Color.accentColor : Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.accentColor : Color.gray.opacity(0.5), lineWidth: 1)
                )
                .cornerRadius(20)
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TabButton(title: "Selected", isSelected: true, action: {})
            TabButton(title: "Not Selected", isSelected: false, action: {})
        }
    }
}

