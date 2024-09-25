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
    @Binding var isSearchViewActive: Bool
    @State private var showingPostWriteView = false

    var body: some View {
        VStack(spacing: 5) {
            HStack {
                ToggleButton(isExpanded: $isExpanded, expandedHeight: $expandedHeight)

                Spacer(minLength: 40)

                // 검색 버튼을 누르면 BoardSearchView로 이동
                Button(action: {
                    isSearchViewActive = true
                }) {
                    HStack(spacing: 3) {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                    }
                    .foregroundColor(.accentColor)
                    .padding(15)
                }

                Spacer(minLength: 39)

                Button(action: {
                    showingPostWriteView = true
                }) {
                    HStack(spacing: 3) {
                        Image(systemName: "pencil.line")
                        Text("글쓰기")
                    }
                    .foregroundColor(.accentColor)
                    .padding(15)
                }
                .sheet(isPresented: $showingPostWriteView) {
                    PostWriteView()
                }

                Spacer()
            }
            .font(.semibold16)
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


struct ExpandedTabView_Previews: PreviewProvider {
    @State static var isExpanded = false
    @State static var expandedHeight: CGFloat = 70
    @State static var isSearchViewActive = false

    static var previews: some View {
        ExpandedTabView(isExpanded: $isExpanded, expandedHeight: $expandedHeight, isSearchViewActive: $isSearchViewActive)
    }
}
