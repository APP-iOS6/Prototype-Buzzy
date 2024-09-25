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
                        Image(systemName: "heart")
                        Text("공감 \(post.likes)")
                    }
                }
                
                Spacer()
                
                Button(action: {
                    postFoundation.toggleScrap(postID: post.id)
                }) {
                    HStack {
                        Image(systemName: post.isScrapped ? "bookmark.fill" : "bookmark")
                        Text(post.isScrapped ? "스크랩 완료" : "스크랩")
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
