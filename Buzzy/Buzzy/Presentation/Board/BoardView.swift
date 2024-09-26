//
//  BoardView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/26/24.
//

import SwiftUI

public struct BoardView: View {
    @Binding var isSearchViewActive: Bool
    @ObservedObject var postFoundation = PostFoundation()
    @State private var selectedPost: BoardPost? = nil
    @State private var isDetailViewActive = false
    @State private var selectedTab: Tab = .tips
    @State private var sortOrder: SortOrder = .recommended
    @State private var isExpanded = false
    @State private var expandedHeight: CGFloat = 70
    
    // 이 이니셜라이저를 추가
    public init(isSearchViewActive: Binding<Bool>) {
        self._isSearchViewActive = isSearchViewActive
    }
    
    public enum Tab {
        case tips, qa
    }
    
    public enum SortOrder: String, CaseIterable {
        case recommended = "최신순"
        case latest = "인기순"
    }
    
    // 게시글을 정렬하는 함수
    private func sortedPosts() -> [BoardPost] {
        let posts = selectedTab == .tips ? postFoundation.posts : postFoundation.qaPosts
        
        switch sortOrder {
        case .recommended:
            return posts.sorted { $0.createdAt > $1.createdAt }
        case .latest:
            return posts.sorted { $0.likes > $1.likes }
        }
    }
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // 기존의 BoardView 내용
                VStack(spacing: -11) {
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
                        VStack(spacing: 18) {
                            ForEach(sortedPosts()) { post in
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
                }
            }
            .navigationDestination(isPresented: $isDetailViewActive) {
                if let selectedPost = selectedPost {
                    PostDetailView(post: selectedPost, postFoundation: postFoundation)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {
                            isDetailViewActive = false
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.semibold16)
                        })
                }
            }
            .navigationDestination(isPresented: $isSearchViewActive) {
                BoardSearchView(isSearchViewActive: $isSearchViewActive)
            }
        }
        
    }
}

struct PostListItemView: View {
    let post: BoardPost
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(post.title)
                    .font(.bold16)
                    .lineLimit(1)
                
                HStack(spacing: 1) {
                    HStack(spacing: 1) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(Color("BuzzyPink"))
                        Text("\(post.likes)")  // 좋아요 개수 표시
                            .font(.semibold12)
                            .foregroundColor(Color("BuzzyPink"))
                    }
                    .frame(width: 36, height: 10)
                    
                    HStack(spacing: 1) {
                        Image(systemName: "bubble.left.fill")
                            .foregroundColor(Color("BuzzySky"))
                            .offset(y: 1)
                        Text("\(post.comments.count)")  // 댓글 개수 표시
                            .font(.semibold12)
                            .foregroundColor(Color("BuzzySky"))
                    }
                    .frame(width: 40, height: 20)
                    
                    HStack(spacing: 8) {
                        Text("\(timeAgoSince(post.createdAt))")  // 시간차 계산 후 표시
                            .font(.regular12)
                            .foregroundColor(.gray)
                        
                        Text("조회 \(Int.random(in: 10...100))")  // 조회 수는 랜덤으로 대체
                            .font(.regular12)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Spacer()
            
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// 시간 차이를 계산하는 함수
func timeAgoSince(_ date: Date) -> String {
    let secondsAgo = Int(Date().timeIntervalSince(date))
    
    let minute = 60
    let hour = 3600
    let day = 86400
    
    if secondsAgo < minute {
        return "\(secondsAgo)초 전"
    } else if secondsAgo < hour {
        return "\(secondsAgo / minute)분 전"
    } else if secondsAgo < day {
        return "\(secondsAgo / hour)시간 전"
    } else {
        return "\(secondsAgo / day)일 전"
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(isSearchViewActive: .constant(false))
    }
}
