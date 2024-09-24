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
                Spacer()
            }
        }
    }
}

struct HomeScrollView: View {
    private var keyword: PartTimeKeyWord = .GoodMood
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(PartTimeKeyWord.allCases, id: \.self) { keyword in
                    HStack {
                        Text("\(keyword.rawValue)")
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
                            ForEach(keyword.annoucementData) { data in
                                NavigationLink(destination: DetailView(announcement: data)) {
                                    CompanyContentView(announcement: data)
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .frame(height: 200)
                    
                }
            }
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
