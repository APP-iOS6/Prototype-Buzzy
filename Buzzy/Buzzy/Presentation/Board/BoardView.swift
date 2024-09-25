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
    
    public enum Tab {
        case tips, qa
    }
    
    public enum SortOrder: String, CaseIterable {
        case recommended = "최신순"
        case latest = "인기순"
    }
    
    
    public var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
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
            }
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
                
                HStack(spacing: 1) {
                    HStack(spacing: 1) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(Color("BuzzyPink"))
                        Text("\(Int.random(in: 1...9))")
                            .font(.semibold12)
                            .foregroundColor(Color("BuzzyPink"))
                    }
                    .frame(width: 30, height: 10)
                    
                    HStack(spacing: 1) {
                        Image(systemName: "bubble.left.fill")
                            .foregroundColor(Color("BuzzySky"))
                            .offset(y: 1)
                        Text("\(Int.random(in: 1...9))")
                            .font(.semibold12)
                            .foregroundColor(Color("BuzzySky"))
                    }
                    .frame(width: 50, height: 20)
                    
                    HStack(spacing: 8){
                        Text("\(Int.random(in: 1...12))시간 전")
                            .font(.regular12)
                            .foregroundColor(.gray)
                        
                        Text("조회 \(Int.random(in: 10...100))")
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

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
