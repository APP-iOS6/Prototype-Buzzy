//
//  MyPostsView.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct Comments: Identifiable {
    let id = UUID()
    let author: String
    let content: String
    let date: String
}

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let date: String
    let comments: Int
    let star: Double
    let commnetsList: [Comments]
}


struct MyPostsView: View {
    @State private var searchText: String = ""
    
    let posts = [
        Post(title: "편의점 알바, 정말 힘들어요!",
             summary: "손님들이 많은 시간대에는 정신이 하나도 없고, 물건 정리도 힘드네요.",
             date: "2024-09-20",
             comments: 3,
             star: 1.5,
             commnetsList: [
                Comments(author: "꿀빨러", content: "맞아요 정말 힘들죠!", date:"2024 -09-21"),
                Comments(author: "알바왕", content: "저도 편의점 알바 했는데 정말 공감해요.", date: "2024-09-22"),
                Comments(author: "힘내세요", content: "일하는 사람들 모두 고생 많으세요!", date: "2024-09-23")
             ]
            ),
        
        Post(title: "카페 알바, 생각보다 좋아요.",
             summary: "손님 응대도 즐겁고, 매장 분위기도 아늑해서 일하기 편해요.",
             date: "2024-09-21",
             comments: 2,
             star: 3.5,
             commnetsList: [
                Comments(author: "커피사랑", content: "카페 알바 좋죠! 분위기가 너무 좋아요.", date: "2024-09-22"),
                Comments(author: "알바중독", content: "손님이 너무 많을 때만 아니면 괜찮은 것 같아요.", date: "2024-09-23")
             ]
            ),
        
        
        Post(title: "패스트푸드점 알바, 빠른 속도가 생명!",
             summary: "주문이 밀릴 때는 정말 정신이 없어요. 속도를 맞추기 위해 열심히 배워야 해요.",
             date: "2024-09-19",
             comments: 15,
             star: 2.5,
             commnetsList: [
                Comments(author: "배달천재", content: "패스트푸드점 알바는 정말 속도전이죠.", date: "2024-09-20"),
                Comments(author: "빨리빨리", content: "속도 맞추는 게 가장 어려웠어요.", date: "2024-09-21"),
                Comments(author: "초보알바", content: "저도 처음엔 엄청 힘들었어요. 금방 익숙해질 거예요.", date: "2024-09-22")
             ]
            ),
        
        Post(title: "서점 알바, 조용해서 너무 좋아요.",
             summary: "책 정리하고, 가끔 손님 응대하는 정도라서 스트레스가 거의 없어요.",
             date: "2024-09-18",
             comments: 5,
             star: 3.0,
             commnetsList: [
                Comments(author: "책벌레", content: "저도 서점 알바 했는데 너무 좋았어요.", date: "2024-09-19"),
                Comments(author: "평화로운알바", content: "손님이 적고 조용해서 좋죠!", date: "2024-09-20")
             ]
            ),
        
        Post(title: "편의점 야간 알바, 생각보다 괜찮아요.",
             summary: "야간이라 손님이 많지 않고, 혼자 일하는 것도 괜찮았어요.",
             date: "2024-09-22",
             comments: 7,
             star: 4.5,
             commnetsList: [
                Comments(author: "밤의주인", content: "야간 편의점은 조용해서 정말 좋아요.", date: "2024-09-23"),
                Comments(author: "야간알바러", content: "저도 야간에 혼자 일할 때가 제일 편해요.", date: "2024-09-24")
             ]
            )
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("검색어를 입력하세요", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray)
                                
                            }
                        }
                        
                    }
                    .padding(.vertical)
                    
                    ForEach(posts) { post in
                        NavigationLink(destination: MyPostDetailView(post: post)) {
                            VStack(alignment: .leading, spacing: 8) {
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
                                    Text("평점: \(post.star, specifier: "%.1f")")
                                }
                                .font(.regular16)
                                Divider()
                                    .padding(.bottom, 20)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
            .navigationTitle("내가 작성한 글")
        }
        .padding()
    }
}

#Preview {
    MyPostsView()
}
