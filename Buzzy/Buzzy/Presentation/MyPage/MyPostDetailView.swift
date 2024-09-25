//
//  MyPostDetailView.swift
//  Buzzy
//
//  Created by Min on 9/25/24.
//

import SwiftUI

struct MyPostDetailView: View {
    let post: Post
    @State private var commentText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.semibold20)
                
                Text(post.date)
                    .font(.regular12)
                
                Text(post.summary)
                    .font(.regular16)
                    .padding(.top, 8)
                
                HStack {
                    Button(action: {
                            print("공감버튼 누름")
                    }) {
                        Image(systemName: "heart")
                        Text("좋아요 0")
                    }
                    
                    Spacer()
                    
                    Text("댓글: \(post.comments)")
                    Text("평점: \(post.star, specifier: "%.1f")")
                        
                }
                .padding(.top, 8)
                .font(.regular14)
                Divider()
                
                    Text("댓글 목록")
                        .font(.semibold16)
                        .padding(.top, 16)
                        .padding(.bottom, 20)

                
                ForEach(post.commnetsList, id: \.author) { comment in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(comment.author)
                                .font(.semibold16)
                            Spacer()
                            Text(comment.date)
                                .font(.regular12)
                                .foregroundColor(.gray)
                        }
                        Text(comment.content)
                            .font(.regular14)
                        Divider()
                    }
                }
                
                HStack {
                    TextField("댓글을 입력하세요...", text: $commentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                        Button(action: {
                            
                        }) {
                            Text("댓글달기")
                    }
                        .disabled(commentText.isEmpty)
                }
                Spacer()
            }
            .navigationTitle("글 상세보기")
            .padding(.top, 15)
        }
        .padding()
    }
}

#Preview {
    MyPostDetailView(post: Post(title: "샘플 포스트", summary: "Summary", date: "Date", comments: 0, star: 0,
                                commnetsList: [
                                    Comments(author: "꿀빨러", content: "맞아요 정말 힘들죠!", date:"2024 -09-21"),
                                    Comments(author: "알바왕", content: "저도 편의점 알바 했는데 정말 공감해요.", date: "2024-09-22"),
                                ]
                               )
    )
}
