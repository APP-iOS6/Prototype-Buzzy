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
            Tab("Home", systemImage: "house.fill", content: {HomeView()})
            Tab("Home", systemImage: "house.fill", content: {HomeView()})

        }
    }
}

#Preview {
    ContentView()
}
