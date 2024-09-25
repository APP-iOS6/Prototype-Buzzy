//
//  HomeView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var workplaces: [(imageName: String, title: String, subtitle: String)] = [
        ("Uniqlo", "유니클로", "강남점"),
        ("Emart", "이마트", "물류센터"),
        ("Starbucks", "스타벅스", "서초점"),
        ("Cu", "CU", "마곡엠코점"),
        ("HanamPig", "하남돼지집", "강남점"),
        ("HongkongBanjum", "홍콩반점", "서초점"),
        ("Coupang", "쿠팡", "물류센터"),
    ]
    @State private var showingDifficultyExplanation = false
    @State private var tooltipPosition: CGPoint = .zero

    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                ZStack {
                    VStack {
                        HStack {
                            Image("Buzzylogowidth")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxy.size.width / 3)
                        }
                        ScrollView {
                            VStack{
                                WorkplaceDifficultyView(
                                    workplaces: $workplaces,
                                    showingDifficultyExplanation: $showingDifficultyExplanation,
                                    tooltipPosition: $tooltipPosition
                                )
                                .overlay(tooltipOverlay)
                                .padding(.bottom, -10)
                                CompanyRankingView()
                                    .padding(.leading, 4)
                                    .padding(.bottom, 5)
                                ForEach(PartTimeKeyWord.allCases, id: \.self) { keyword in
                                    HomeScrollView(keyword: keyword)
                                        .frame(height: proxy.size.width * 0.6)
                                        .padding(.bottom)
                                }
                               
                            }
                        }
                    }
                    
                }
            }
        }
    }
    @ViewBuilder
    public var tooltipOverlay: some View {
        if showingDifficultyExplanation {
            TooltipView(text: "업무 난이도를 평가해요\n★1개~2개 : easy\n★2개~3개 : normal\n★4개~5개 : hard")
                .position(x: tooltipPosition.x + 95, y: tooltipPosition.y + 15)
                .transition(.opacity)
                .zIndex(2)
        }
    }

}

struct HomeScrollView: View {
    private var keyword: PartTimeKeyWord
    init(keyword: PartTimeKeyWord) {
        self.keyword = keyword
    }
    var body: some View {
            VStack(alignment: .leading) {
                    HStack {
                        Text("\(keyword.rawValue)")
                            .font(.semibold16)
                            .padding()
                        Spacer()
                        NavigationLink(destination: CompanyListView(keyword: keyword)) {
                            HStack {
                                Text("더보기")
                                    .font(.subheadline)
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                            .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom, -15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(keyword.annoucementData) { data in
                                NavigationLink(destination: DetailView(announcement: data)) {
                                    CompanyContentView(announcement: data)
                                       // .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.leading, 9)
                    }
                 //   .frame(height: 250)
 
                
            }
        }
    
    
}

#Preview {
    NavigationStack {
        HomeView()
    }
}

#Preview("scroll") {
    HomeScrollView(keyword: .region)
}

