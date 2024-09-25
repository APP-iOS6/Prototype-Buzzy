//
//  DetailView.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import SwiftUI

struct DetailView: View {
    @State private var selectedTab = "근무조건" // 기본 선택된 탭
    private var announcement: Announcement
    init(announcement: Announcement) {
        self.announcement = announcement
    }
    
    var tabs = ["근무조건", "리뷰", "난이도"] // 탭 항목들
    
    var body: some View {
        ZStack {
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
                    
                    // 탭바 메뉴 (뉴스룸, 프리미엄 리뷰, 리뷰 등)
                    Picker("Tabs", selection: $selectedTab) {
                        ForEach(tabs, id: \.self) { tab in
                            Text(tab).tag(tab)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()) // 세그먼트 스타일
                    .padding(.horizontal)
                    
                    if selectedTab == "근무조건" {
                        WorkConditionsView() // 근무조건 뷰
                            .padding(.top, -10)
                    } else if selectedTab == "리뷰" {
                        ReviewsView() // 리뷰 뷰
                    } else if selectedTab == "난이도" {
                        WorkplaceDifficultyDetailView(workplace: (imageName: announcement.imageName, title: announcement.title, subtitle: announcement.company))
                    }
                    
                    Spacer()
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // 글쓰기 액션
                    }){
                        Image(systemName: "pencil")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 28, height: 28)
                            .padding()
                    }
                    .background(.accent)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                }
                .padding()
            }
        }
        .navigationBarTitle("\(announcement.company)", displayMode: .inline)
    }
}

struct WorkConditionsView: View {
    var body: some View {
        Image("image1")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ReviewsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("전체 만족도 통계 (73개)")
                .font(.headline)
                .padding(.horizontal)
            
            HStack {
                Text("⭐️ 3.7")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("동료 분위기")
                            .font(.subheadline)
                        Spacer()
                        Text("⭐️ 4.0")
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
            VStack {
                Divider()
                Text(" ⭐️  4.0")
                    .font(.regular20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Image("review1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Divider()
                Text(" ⭐️  3.0")
                    .font(.regular20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Image("review2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Divider()
                Text(" ⭐️  4.0")
                    .font(.regular20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Image("review3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
      
            }
            .padding()
            
        }
    }
}

struct InterviewFeedbackView: View {
    var body: some View {
        VStack {
            Text("면접 후기 내용")
                .font(.title)
                .padding()
            // 추가적인 내용 구성
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(announcement: Announcement.annoucementData.first!)
    }
}
