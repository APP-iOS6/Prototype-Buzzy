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
                    //임시로 넣어봤는데 안어울려서 바꾸고 ui 위치 맞게 조정 예정
                    if index == 0 {
                        Image("gold")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    else if index == 1 {
                        Image("silver")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    else if index == 2 {
                        Image("bronze")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else{
                        Text("\(index + 1).") // 순위 표시
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                    }
                    Image(rank.logo)
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
        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    HomeRankingListView(viewModel: HomeRankingViewModel()) // 데이터 전달
}
