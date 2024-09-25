//
//  ExpandedTabView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/26/24.
//

import SwiftUI

struct ExpandedTabView: View {
    @Binding var isExpanded: Bool
    @Binding var expandedHeight: CGFloat
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                ToggleButton(isExpanded: $isExpanded, expandedHeight: $expandedHeight)
                
                Spacer()
                
                ActionButton(image: "magnifyingglass", title: "검색", action: {
                    // 검색 기능 구현
                })
                
                Spacer(minLength: 50)
                
                ActionButton(image: "pencil.line", title: "글쓰기", action: {
                    // 글쓰기 기능 구현
                })
                
                Spacer()
            }
            .padding(.horizontal)
            
            if isExpanded {
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct ToggleButton: View {
    @Binding var isExpanded: Bool
    @Binding var expandedHeight: CGFloat
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                isExpanded.toggle()
                expandedHeight = isExpanded ? UIScreen.main.bounds.height * 0.1 : 70
            }
        }) {
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .foregroundColor(.accentColor)
                .padding(40)
        }
    }
}

struct ActionButton: View {
    var image: String
    var title: String
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: image)
            Text(title)
        }
        .foregroundColor(.accentColor)
        .padding(15)
        .onTapGesture(perform: action)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
