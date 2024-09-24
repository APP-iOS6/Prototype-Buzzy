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
    
    public enum Tab {
        case tips, qa
    }
    
    public enum SortOrder: String, CaseIterable {
        case recommended = "추천순"
        case latest = "최신순"
    }
    
    @State private var workplaces: [(imageName: String, title: String, subtitle: String)] = [
        ("Uniqlo", "유니클로", "강남점"),
        ("Emart", "이마트", "물류센터"),
        ("Starbucks", "스타벅스", "서초점"),
        ("Cu", "CU", "마곡엠코점"),
        ("HanamPig", "하남돼지집", "강남점"),
        ("HongkongBanjum", "홍콩반점", "서초점"),
        ("Coupang", "쿠팡", "물류센터"),
    ]
    
    public var body: some View {
        NavigationStack {  // BoardView에 NavigationStack을 적용
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    // 여기서 WorkplaceDifficultyView를 호출할 때 selectedWorkplace와 navigateToDetail을 전달하지 않음
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

    public init() {}
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
