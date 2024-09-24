//
//  CompanyListView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct CompanyListView: View {
    var body: some View {
        VStack {
            Text("시급이 높은 공고")
                .font(.semibold20)
            
        }
        .navigationTitle("시급이 높아요!")
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
                .frame(width: 208, height: 146)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("\(announcement.title)")
                .frame(maxWidth: 200, alignment: .leading) // 텍스트 왼쪽 정렬
                .lineLimit(2)
                .font(.semibold16)
            
            Text("\(announcement.company)")
                .foregroundColor(Color.gray)
                .frame(maxWidth: 190, alignment: .leading) // 텍스트 왼쪽 정렬
                .font(.regular14)
                
        }
        .padding() // 전체 VStack에 패딩 추가
    }
    
}

#Preview {
    NavigationStack {
        CompanyListView()
    }
}


#Preview("content") {
    
    CompanyContentView(announcement: Announcement.annoucementData.first!)
    
}
