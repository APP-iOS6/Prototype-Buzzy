//
//  MyPostsView.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let date: String
    let comments: Int
    let star: Double
}


struct MyPostsView: View {
    
    let posts = [
        Post(title: "편의점 알바, 정말 힘들어요!",
             summary: "손님들이 많은 시간대에는 정신이 하나도 없고, 물건 정리도 힘드네요.",
             date: "2024-09-20",
             comments: 12,
             star: 1.5),
        
        Post(title: "카페 알바, 생각보다 좋아요.",
             summary: "손님 응대도 즐겁고, 매장 분위기도 아늑해서 일하기 편해요.",
             date: "2024-09-21",
             comments: 8,
             star: 3.5),
        
        Post(title: "패스트푸드점 알바, 빠른 속도가 생명!",
             summary: "주문이 밀릴 때는 정말 정신이 없어요. 속도를 맞추기 위해 열심히 배워야 해요.",
             date: "2024-09-19",
             comments: 15,
             star: 2.5),
        
        Post(title: "서점 알바, 조용해서 너무 좋아요.",
             summary: "책 정리하고, 가끔 손님 응대하는 정도라서 스트레스가 거의 없어요.",
             date: "2024-09-18",
             comments: 5,
             star: 3.0),
        
        Post(title: "편의점 야간 알바, 생각보다 괜찮아요.",
             summary: "야간이라 손님이 많지 않고, 혼자 일하는 것도 괜찮았어요.",
             date: "2024-09-22",
             comments: 7,
             star: 4.5)
    ]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                TextField("검색어를 입력하세요", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                ForEach(posts) { post in
                    Text(post.title)
                        .font(.semibold20)
                    
                    Text(post.summary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .font(.regular16)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text(post.date)
                            .font(.regular12)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        Text("댓글 \(post.comments)")
                            
                        
                        Text("평점: \(post.star, specifier: "%0.1f")")
                    }
                    .font(.regular16)
                    Divider()
                        .padding(.bottom, 20)
                    
                }
            }
            .navigationTitle("내가 작성한 글")
        }
        .padding(.top, 8)
    }
}

#Preview {
    MyPostsView()
}
