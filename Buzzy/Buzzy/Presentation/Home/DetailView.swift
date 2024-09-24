//
//  DetailView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct DetailView: View {
    private var announcement: Announcement
    init(announcement: Announcement) {
        self.announcement = announcement
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
            
                // 상단 회사 로고 및 정보
                HStack {
                    Image(announcement.imageName) // 로고 이미지
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(announcement.title)")
                            .font(.title2)
                            .bold()
                        
                        Text("\(announcement.company)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                
                // 별점 및 버튼
                HStack {
                    
                    Spacer()
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
                                Text("동료 분위기")
                                    .font(.subheadline)
                                Spacer()
                                Text("⭐️ 2.5")
                            }
                            ProgressView(value: 0.5)
                            
                            HStack {
                                Text("시급")
                                    .font(.subheadline)
                                Spacer()
                                Text("⭐️ 3.3")
                            }
                            ProgressView(value: 0.7) // 워라밸 프로그레스 바
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("\(announcement.company)", displayMode: .inline) // 상단 네비게이션 타이틀
    }
}

#Preview {
    NavigationStack {
        DetailView(announcement: Announcement.annoucementData.first!)
    }
}
