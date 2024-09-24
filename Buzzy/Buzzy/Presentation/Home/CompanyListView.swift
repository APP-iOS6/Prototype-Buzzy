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
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) { // 2개의 열로 그리드 설정
                ForEach(Announcement.annoucementData) { announcement in
                    NavigationLink(destination: CompanyDetailView(announcement: announcement)) {
                        CompanyContentView(announcement: announcement)
                    }
                    .buttonStyle(PlainButtonStyle()) // 버튼 스타일을 기본으로 설정
                }
            }
            //.padding() // 여백 추가
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
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("\(announcement.title)")
                .frame(maxWidth: .infinity, alignment: .leading) // 텍스트 왼쪽 정렬
                .lineLimit(2)
                .font(.semibold16)
            
            Text("\(announcement.company)")
                .foregroundColor(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading) // 텍스트 왼쪽 정렬
                .font(.regular14)
            
        }
        .padding() // 전체 VStack에 패딩 추가
    }
    
}
struct CompanyDetailView: View {
    var announcement: Announcement
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // 상단 회사 로고 및 정보
                HStack {
                    Image("company_logo") // 로고 이미지
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("(주)티모넷")
                            .font(.title2)
                            .bold()
                        
                        Text("IT/웹/통신")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                // 별점 및 버튼
                HStack {
                    Text("⭐️ 2.7 전체 기간")
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            // 팔로우 액션
                        }) {
                            Text("+ 팔로우")
                                .font(.subheadline)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                        
                        Button(action: {
                            // 작성하기 액션
                        }) {
                            HStack {
                                Image(systemName: "pencil")
                                Text("작성하기")
                                    .font(.subheadline)
                            }
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
                
                // 탭바 메뉴 (뉴스룸, 프리미엄 리뷰, 리뷰 등)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Text("뉴스룸")
                        Text("프리미엄 리뷰")
                        Text("리뷰").bold().underline() // 현재 선택된 탭 강조
                        Text("연봉")
                        Text("면접후기")
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .foregroundColor(.gray)
                }
                
                // 리뷰 요약 섹션
                VStack(alignment: .leading, spacing: 10) {
                    Text("전체 만족도 통계 (73개)")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("⭐️ 2.7")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("복지/급여")
                                    .font(.subheadline)
                                Spacer()
                                Text("⭐️ 2.5")
                            }
                            ProgressView(value: 0.5) // 복지/급여 프로그레스 바
                            
                            HStack {
                                Text("워라밸")
                                    .font(.subheadline)
                                Spacer()
                                Text("⭐️ 3.3")
                            }
                            ProgressView(value: 0.7) // 워라밸 프로그레스 바
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("(주)티모넷", displayMode: .inline) // 상단 네비게이션 타이틀
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

#Preview("detail") {
    
    CompanyContentView(announcement: Announcement.annoucementData.first!)
    
}
