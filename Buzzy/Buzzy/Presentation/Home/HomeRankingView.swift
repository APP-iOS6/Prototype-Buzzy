//
//  HomeRankingView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//

import SwiftUI

struct HomeRankingView: View {
    @StateObject private var viewModel = HomeRankingViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: -20) {
                HStack {
                    Text("알바 랭킹")
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeRankingDetailView()) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24))
                            .padding()
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                HStack {
                    Button("조회수 급상승") {
                        print("조회수 버튼")
                        viewModel.sortRanks(by: .byViews) // 조회수로 정렬
                    }
                    .padding(5)
                    .buttonStyle(PlainButtonStyle())
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Button("평점순") {
                        viewModel.sortRanks(by: .byRating) // 평점순으로 정렬
                    }
                    .padding(5)
                    .buttonStyle(PlainButtonStyle())
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Button("리뷰순") {
                        viewModel.sortRanks(by: .default) // 기본 정렬 (원래 순서)
                    }
                    .padding(5)
                    .buttonStyle(PlainButtonStyle())
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Spacer()
                }
                .padding()

                // 랭킹 리스트 뷰
                HomeRankingListView(viewModel: viewModel)
                
                
                Button("랭킹 더 보기") {
                  
                }
                .padding(.horizontal, 130)
                .padding(.vertical, 10)
                .buttonStyle(PlainButtonStyle())
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                .padding(.top, 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeRankingView()
}

