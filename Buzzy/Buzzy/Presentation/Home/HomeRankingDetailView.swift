//
//  HomeRankingDetailView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//
import SwiftUI

struct HomeRankingDetailView: View {
    @ObservedObject var viewModel: HomeRankingViewModel // ViewModel 수정

    var body: some View {
        List {
            ForEach(Array(viewModel.sortedRanks.enumerated()), id: \.element.id) { index, rank in
                HStack {
                    Text("\(index + 1)") // 순위 표시
                        .bold()
                        .foregroundColor(.blue)
                        .padding()
                    Image(systemName: rank.logo)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.yellow)
                    VStack(alignment: .leading) {
                        Text(rank.name)
                            .font(.system(size: 16, weight: .bold))
                        HStack(spacing: 0) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(rank.rating)
                            Text("(\(rank.review))")
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(5)
            }
        }
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    HomeRankingDetailView(viewModel: HomeRankingViewModel()) // 초기 데이터 전달
}
