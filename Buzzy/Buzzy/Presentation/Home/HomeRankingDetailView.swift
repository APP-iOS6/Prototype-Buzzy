//
//  HomeRankingDetailView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//

import SwiftUI

struct HomeRankingDetailView: View {
    @StateObject private var viewModel = HomeRankingViewModel()
    @State private var selectedOption: String = "조회수 급상승 랭킹"
    
    var body: some View {
        VStack {
            HomeRankingListView(viewModel: viewModel)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Menu {
                    Button("조회수 급상승") {
                        selectedOption = "조회수 급상승 랭킹"
                        viewModel.sortRanks(by: .byViews)
                    }
                    Button("평점순") {
                        selectedOption = "평점순 랭킹"
                        viewModel.sortRanks(by: .byRating)
                    }
                    Button("리뷰순") {
                        selectedOption = "리뷰순 랭킹"
                        viewModel.sortRanks(by: .byViews)
                    }
                } label: {
                    HStack {
                        Text(selectedOption)
                            .font(.bold16)
                        Image(systemName: "chevron.down")
                            .font(.regular16)
                    }
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarBackButtonHidden(false) //백버튼 유지
    }
}

#Preview {
    HomeRankingDetailView()
}

