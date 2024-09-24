//
//  HomeView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HomeScrollView()
                HomeScrollView()
                Spacer()
            }
        }
    }
}

struct HomeScrollView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("시급이 높아요")
                    .font(.semibold20)
                    .padding()
                Spacer()
                NavigationLink(destination: CompanyListView()) {
                    HStack {
                        Text("더 보기")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .foregroundColor(.gray)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(Announcement.annoucementData) { data in
                        NavigationLink(destination: CompanyDetailView(announcement: data)) {
                            CompanyContentView(announcement: data)
                                .frame(width: .infinity, height: (200))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .frame(height: 200)
            
        }
    }
    
}

#Preview {
    NavigationStack {
        HomeView()
    }
}

#Preview("scroll") {
    HomeScrollView()
}
