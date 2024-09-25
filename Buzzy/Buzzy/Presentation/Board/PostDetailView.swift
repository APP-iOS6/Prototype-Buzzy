//
//  PostDetailView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/25/24.
//

import SwiftUI

public struct PostDetailView: View {
    let post: BoardPost
    @ObservedObject var postFoundation: PostFoundation
    @State private var newComment: String = ""

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(post.title)
                .font(.title)
                .bold()
            Text(post.content)
                .font(.body)
            
            HStack {
                Button(action: {
                    postFoundation.likePost(postID: post.id)
                }) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color("BuzzyPink"))
                        Text("좋아요 \(post.likes)")
                            .foregroundColor(Color("BuzzyPink"))
                    }
                }
                
                Spacer()
                
                Button(action: {
                    postFoundation.toggleScrap(postID: post.id)
                }) {
                    HStack {
                        Image(systemName: post.isScrapped ? "bookmark.fill" : "bookmark")
                            .foregroundColor(Color("BuzzyYellow"))
                        Text(post.isScrapped ? "스크랩 완료" : "스크랩")
                            .foregroundColor(Color("BuzzyYellow"))
                    }
                }
            }
            .padding(.vertical)
            
            Text("댓글")
                .font(.headline)
            ForEach(post.comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.author).font(.bold16)
                    Text(comment.content)
                }
            }
            
            HStack {
                TextField("댓글 달기...", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    postFoundation.addComment(to: post.id, author: "익명", content: newComment)
                    newComment = ""
                }) {
                    Text("댓글 달기")
                }
                .disabled(newComment.isEmpty)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .navigationTitle("게시글 상세")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePost = BoardPost(
            id: UUID(),
            title: "샘플 게시글 제목",
            content: "이것은 샘플 게시글의 내용입니다. 여기에 게시글의 전체 내용이 표시됩니다.",
            comments: [
                BoardComment(author: "사용자1", content: "첫 번째 댓글입니다."),
                BoardComment(author: "사용자2", content: "두 번째 댓글입니다.")
            ],
            likes: 5,
            isScrapped: false
        )
        
        let postFoundation = PostFoundation()
        
        return NavigationView {
            PostDetailView(post: samplePost, postFoundation: postFoundation)
        }
    }
}
