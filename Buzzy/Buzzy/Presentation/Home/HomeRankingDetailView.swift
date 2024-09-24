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
        VStack() {
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
                    viewModel.sortRanks(by:.byViews)
                }
            } label: {
                HStack {
                    Text(selectedOption)
                        .font(.bold24)
                    Image(systemName: "chevron.down")
                        .font(.regular24)
                }
            }
            .foregroundColor(.black)
        }
        
        HomeRankingListView(viewModel: viewModel)
        
    }
    
}


#Preview {
    HomeRankingDetailView()
}
