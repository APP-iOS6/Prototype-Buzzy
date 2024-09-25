//
//  CompanyListView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct CompanyListView: View {
    let columns = [
        GridItem(.flexible()), // 첫 번째 열
        GridItem(.flexible())  // 두 번째 열
    ]
    private var keyword: PartTimeKeyWord
    
    init(keyword: PartTimeKeyWord) {
        self.keyword = keyword
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) { // 2개의 열로 그리드 설정
                ForEach(Announcement.annoucementData) { announcement in
                    NavigationLink(destination: DetailView(announcement: announcement)) {
                        CompanyContentView(announcement: announcement)
                    }
                    .buttonStyle(PlainButtonStyle()) // 버튼 스타일을 기본으로 설정
                }
            }
            //.padding() // 여백 추가
        }
        .navigationTitle("\(keyword.rawValue)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CompanyContentView: View {
    
    private var announcement: Announcement
    
    init(announcement: Announcement) {
        self.announcement = announcement
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image("\(announcement.imageName)")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
            
            Text("\(announcement.title)")
                .frame(maxWidth: .infinity, alignment: .leading) // 텍스트 왼쪽 정렬
                .padding(.leading, 5)
                .lineLimit(2)
                .font(.semibold16)
            
            Text("\(announcement.company)")
                .foregroundColor(Color.gray)
                .padding(.leading, 5)
                .frame(maxWidth: .infinity, alignment: .leading) // 텍스트 왼쪽 정렬
                .font(.regular14)
            
        }
        .padding(5) // 전체 VStack에 패딩 추가
    }
    
}

//#Preview {
//    NavigationStack {
//        CompanyListView()
//    }
//}


#Preview("content") {
    
    CompanyContentView(announcement: Announcement.annoucementData.first!)
    
}

#Preview("detail") {
    
    CompanyContentView(announcement: Announcement.annoucementData.first!)
    
}
