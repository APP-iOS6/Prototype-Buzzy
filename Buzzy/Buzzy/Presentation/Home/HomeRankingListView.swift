//
//  HomeRankingDetailView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//
import SwiftUI

struct HomeRankingListView: View {
    @ObservedObject var viewModel: HomeRankingViewModel // ViewModel 수정
    
    var body: some View {
        List {
            ForEach(Array(viewModel.sortedRanks.enumerated()), id: \.element.id) { index, rank in
                HStack {
                    //일단 그냥 이미지로 안하고 숫자로 할게용
                    Text("\(index + 1).") // 순위 표시
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                    //                    }
                    Image(rank.logo)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.yellow)
                    VStack(alignment: .leading) {
                        Text(rank.name)
                            .font(.bold16)
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
        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    HomeRankingListView(viewModel: HomeRankingViewModel()) // 데이터 전달
}
