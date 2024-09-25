//
//  ContentView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isExpanded: Bool = false
    @State private var expandedHeight: CGFloat = 70
    @State private var isSearchViewActive = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("홈")
                    }
                    .tag(0)
                BoardView(isSearchViewActive: $isSearchViewActive)
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle")
                        Text("게시판")
                    }
                    .tag(1)
                RecruitView()
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("모집")
                    }
                    .tag(2)
                MyPageView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("마이페이지")
                    }
                    .tag(3)
            }
            
            if selectedTab == 1 && !isSearchViewActive {
                ExpandedTabView(isExpanded: $isExpanded, expandedHeight: $expandedHeight, isSearchViewActive: $isSearchViewActive)
                    .frame(height: expandedHeight)
                    .background(Color.barcolor)
                    .shadow(color: .black.opacity(0.1), radius: 1)
                    .animation(.easeInOut, value: expandedHeight)
                    .offset(y: isExpanded ? 38 : expandedHeight - 118)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
