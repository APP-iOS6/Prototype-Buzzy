//
//  MyComm.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct Comment: Identifiable {
    let id = UUID()
    let title: String
    let comment: String
    let date: String
}

struct MyCommentsView: View {
    
    let comments: [Comment] = [
        Comment(title: "편의점 알바, 정말 힘들었어요!", comment: "뭐가 힘들다고 난리임;", date: "2024-09-24"),
        Comment(title: "카페 알바, 손님이 많아서 힘들어!", comment: "주말에는 정말 바빠요.", date: "2024-09-23"),
        Comment(title: "마트 알바, 일은 쉬운데 지루해", comment: "시간이 너무 안 가요.", date: "2024-09-22"),
        Comment(title: "배달 알바, 날씨가 영향을 미쳐요", comment: "비 오는 날은 특히 힘들어요.", date: "2024-09-21"),
        Comment(title: "학원 알바, 학생들이 귀여워요", comment: "아이들과 함께하는 게 재밌어요.", date: "2024-09-20")
    ]

    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                TextField("검색어를 입력하세요", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                ForEach(comments) { com in
                    Text(com.title)
                        .font(.semibold20)
                    
                    Text(com.comment)
                        .font(.regular16)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        
                        Text(com.date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    
                    Divider()
                        .padding(.bottom, 20.0)
                }
            }
            .navigationTitle("내가 작성한 댓글")
            .padding(.horizontal, 20.0)
        }
        .padding(.top, 8)
    }
}

#Preview {
    MyCommentsView()
}
