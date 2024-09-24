//
//  ContentView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.fill", content: {HomeView()})
            Tab("게시판", systemImage: "list.bullet.rectangle", content: {BoardView()})
            Tab("모집", systemImage: "person.3.sequence.fill", content: {RecruitView()})
            Tab("마이페이지", systemImage: "person.crop.circle", content: {MyPageView()})

        }
    }
}

#Preview {
    ContentView()
}
