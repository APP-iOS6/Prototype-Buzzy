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
    @State private var showNotification = false
    @State private var notificationMessage = ""
    @State private var replyingTo: BoardComment?

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // 작성자 정보
                HStack {
                    Image(post.profileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(post.author)
                        .font(.semibold16)
                }
                
                Divider()

                // 게시글 내용
                Text(post.title)
                    .font(.semibold20)
                
                Divider()
                
                Text(post.content)
                    .font(.regular16)

                // 게시글 이미지
                if !post.imageName.isEmpty {
                    Image(post.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipped()
                }
                Divider()
                // 좋아요 및 스크랩 버튼
                HStack {
                    Button(action: {
                        postFoundation.increaseLike(for: post.id)
                        showNotification(message: "좋아요를 눌렀습니다")
                    }) {
                        HStack {
                            Image(systemName: "hand.thumbsup")
                                .font(.regular20)
                            Text("\(post.likes)")
                                .font(.regular14)
                        }
                        
                        .foregroundColor(post.likes > 0 ? Color("BuzzyPink") : .gray.opacity(0.1))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        postFoundation.toggleScrap(postID: post.id)
                        showNotification(message: post.isScrapped ? "북마크 해제되었습니다" : "북마크 되었습니다")
                    }) {
                        HStack {
                            Image(systemName: post.isScrapped ? "bookmark" : "bookmark.fill")
                                .font(.regular24)
                        }
                        .font(.regular24)
                        .foregroundColor(post.isScrapped ? Color.buzzyYellow : .gray.opacity(0.1))
                    }
                }
                .padding(.vertical)

                // 댓글 섹션
                Text("댓글 \(post.comments.count)")
                    .font(.semibold16)
                
                ForEach(post.comments) { comment in
                    CommentView(comment: comment, replyAction: { replyingTo = comment })
                }

                // 새 댓글 입력
                HStack {
                    TextField("댓글로 자유롭게 이야기해보세요", text: $newComment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if let replyTo = replyingTo {
                            postFoundation.addReply(to: post.id, commentID: replyTo.id, author: "익명", content: newComment)
                        } else {
                            postFoundation.addComment(to: post.id, author: "익명", content: newComment)
                        }
                        newComment = ""
                        replyingTo = nil
                    }) {
                        Text("등록")
                    }
                    .disabled(newComment.isEmpty)
                }
                .padding(.vertical)
            }
            .padding()
        }
        .navigationTitle("\(post.author)님의 게시물")
        .navigationBarTitleDisplayMode(.inline)
        .overlay(
            NotificationView(message: notificationMessage, isShowing: $showNotification)
        )
    }

    private func showNotification(message: String) {
        notificationMessage = message
        showNotification = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showNotification = false
        }
    }
}

struct CommentView: View {
    let comment: BoardComment
    let replyAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(comment.author).font(.bold16)
            Text(comment.content)
            Button("답글 달기", action: replyAction)
                .font(.regular12)
                .foregroundStyle(.gray)
            
            ForEach(comment.replies) { reply in
                HStack {
                    Text("↳")
                    VStack(alignment: .leading) {
                        Text(reply.author).font(.regular14)
                        Text(reply.content)
                            
                    }
                }
                .padding(.leading)
            }
        }
        .padding(.vertical, 4)
    }
}

struct NotificationView: View {
    let message: String
    @Binding var isShowing: Bool

    var body: some View {
        VStack {
            Spacer()
            if isShowing {
                Text(message)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: isShowing)
            }
        }
        .padding(.bottom)
    }
}



struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // 샘플 댓글 생성
        _ = [
            BoardComment(id: UUID(), author: "사용자1", content: "첫 번째 댓글입니다.", replies: []),
            BoardComment(id: UUID(), author: "사용자2", content: "두 번째 댓글입니다.", replies: [
                BoardComment(id: UUID(), author: "답글 사용자1", content: "첫 번째 답글입니다.", replies: [])
            ])
        ]
        
        // 샘플 게시물 생성
        let samplePost = BoardPost(
            id: UUID(),
            title: "샘플 게시물",
            content: "이것은 샘플 게시물의 내용입니다. 여기에 본문의 텍스트가 포함됩니다.",
            author: "익명",
            profileImage: "Tuna",
            comments: [
                BoardComment(author: "튜나", content: "ㄹㅇㅋㅋ"),
                BoardComment(author: "요시", content: "나도 말대꾸 했다가 점장 불려가서 욕 먹음ㅋㅋ"),
                BoardComment(author: "준영", content: "난 아예 무표정으로 듣다가 그냥 넘김ㅋㅋ 말대꾸하면 더 피곤함")
              ],
            likes: 22,
            isScrapped: true,
            imageName: "ShopCat"
        )
        
        
        // 게시물 관리 객체 생성
        let postFoundation = PostFoundation()
        
        // 미리보기 화면
        return NavigationView {
            PostDetailView(post: samplePost, postFoundation: postFoundation)
        }
    }
}
