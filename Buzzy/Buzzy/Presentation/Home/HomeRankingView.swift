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
        VStack(spacing: -10){
            HStack {
                Text("알바 랭킹").font(.bold24)
                
                Spacer()
                
                Button {
                    // 여기에 상세 페이지로 전환하는 코드 추가
                   
                } label: {
                    Image(systemName: "greaterthan")
                        .foregroundStyle(Color.black)
                        .font(.regular24)
                }
            }
            .padding()
            
            HStack() {
                Button("조회수 급상승") {
                    print("조회수 버튼")
                    viewModel.sortRanks(by: .byViews) // 조회수로 정렬해야하는데 리뷰 많은 순으로 정렬되어있음현재
                    
                }
                .padding(5)
                .buttonStyle(PlainButtonStyle())
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                
                Button("평점순") {
                    viewModel.sortRanks(by: .byRating) // 평점으로정렬
                }
                .padding(5)
                .buttonStyle(PlainButtonStyle())
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                
                Button("리뷰순") {
                    viewModel.sortRanks(by: .default) // 기본 정렬 배열에 박혀있는 순서로 되어있음현재
                }
                .padding(5)
                .buttonStyle(PlainButtonStyle())
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                Spacer()
            }
            .padding()

            HomeRankingDetailView(viewModel: viewModel) // ViewModel 넘겨주기
        }
        
        Button("랭킹 더 보기") {
            
        }
        .padding(.horizontal,130)
        .padding(.vertical,10)
        .buttonStyle(PlainButtonStyle())
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
        Spacer()
    }
}

#Preview {
    HomeRankingView()
}

