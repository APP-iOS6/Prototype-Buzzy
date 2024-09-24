//
//  BoardView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct BoardView: View {
    @State private var selectedTab: Tab = .tips
    @State private var sortOrder: SortOrder = .recommended
    @State private var showingDifficultyExplanation = false
    @State private var tooltipPosition: CGPoint = .zero
//    @State private var isExpanded: Bool = false
//    @State private var expandedHeight: CGFloat = 50
    
    public enum Tab {
        case tips, qa
    }
    
    public enum SortOrder: String, CaseIterable {
        case recommended = "추천순"
        case latest = "최신순"
    }
    
    @State private var workplaces: [(imageName: String, title: String, subtitle: String)] = [
        ("Starbucks", "스타벅스", "스타벅스 서초점"),
        ("Emart", "이마트", "이마트 물류센터"),
        ("Cu", "CU", "마곡엠코점"),
        ("Coupang", "쿠팡", "쿠팡 물류센터"),
        ("HanamPig", "하남돼지집", "하남돼지집 강남점"),
        ("HongkongBanjum", "홍콩반점", "홍콩반점 서초점"),
        ("Uniqlo", "유니클로", "유니클로 강남점")
    ]
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                WorkplaceDifficultyView(
                    workplaces: $workplaces,
                    showingDifficultyExplanation: $showingDifficultyExplanation,
                    tooltipPosition: $tooltipPosition
                )

                HStack {
                    HStack(spacing: 10) {
                        TabButton(title: "🍯 꿀팁", isSelected: selectedTab == .tips) {
                            selectedTab = .tips
                        }
                        TabButton(title: "💬 Q&A", isSelected: selectedTab == .qa) {
                            selectedTab = .qa
                        }
                    }
                    Spacer()
                    SortOrderMenu(sortOrder: $sortOrder)
                }
                .padding()
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(0..<20) { _ in
                            if selectedTab == .tips {
                                TipPostView()
                            } else {
                                QAPostView()
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .background(Color.gray.opacity(0.1))
            .overlay(tooltipOverlay)
            
            // 하단에 ExpandedTabView 추가
//            ExpandedTabView(isExpanded: $isExpanded, expandedHeight: $expandedHeight)
//                .frame(height: expandedHeight)
//                .background(Color.white)
//                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
//                .animation(.easeInOut, value: expandedHeight)
//                .offset(y: isExpanded ? 50 : expandedHeight - 50)
        }
    }
    
    @ViewBuilder
    public var tooltipOverlay: some View {
        if showingDifficultyExplanation {
            TooltipView(text: "업무 난이도를 평가해요\n★쉬움\n★★중간\n★★★어려움")
                .position(x: tooltipPosition.x + 95, y: tooltipPosition.y + 15)
                .transition(.opacity)
                .zIndex(2)
        }
    }
    
    public init() {}
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
