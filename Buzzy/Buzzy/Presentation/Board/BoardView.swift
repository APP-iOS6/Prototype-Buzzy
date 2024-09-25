//
//  BoardView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct BoardView: View {
    @ObservedObject var postFoundation = PostFoundation()
    @State private var selectedPost: BoardPost? = nil
    @State private var isDetailViewActive = false
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
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack(spacing: -11) {
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
                        LazyVStack(spacing: 18) {
                            ForEach(selectedTab == .tips ? postFoundation.posts : postFoundation.qaPosts) { post in
                                Button(action: {
                                    selectedPost = post
                                    isDetailViewActive = true
                                }) {
                                    PostListItemView(post: post)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.vertical)
                    }
                    .navigationDestination(isPresented: $isDetailViewActive) {
                        if let selectedPost = selectedPost {
                            PostDetailView(post: selectedPost, postFoundation: postFoundation)
                        }
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

struct PostListItemView: View {
    let post: BoardPost
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(post.title)
                    .font(.bold16)
                    .lineLimit(1)
                
                HStack(spacing: 10) {
                    Text("1시간 전")
                        .font(.regular12)
                        .foregroundColor(.gray)
                    
                    Text("조회 \(Int.random(in: 10...100))")
                        .font(.regular12)
                        .foregroundColor(.gray)
                    
                    Text("좋아요 \(post.likes)")
                        .font(.regular12)
                        .foregroundColor(.gray)
                    
                    Text("댓글 \(post.comments.count)")
                        .font(.regular12)
                        .foregroundColor(.gray)
                }
            }
            
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "photo")
                        .foregroundColor(.white)
                )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
