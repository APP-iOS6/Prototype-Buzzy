//
//  HomeRankingDetailView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//
import SwiftUI

struct HomeRankingListView: View {
    @ObservedObject var viewModel: HomeRankingViewModel // ViewModel 수정
    var showShadowAndSeparator: Bool = true // 홈랭킹뷰에서는 구분선 보이게 하기 위함

    var body: some View {
        List {
            ForEach(viewModel.sortedRanks.indices, id: \.self) { index in // 인덱스를 사용
                let rank = viewModel.sortedRanks[index] // 인덱스를 사용하여 rank 가져옴
                
                HStack(spacing: 16) {
                    // 순위에 따른 메달 또는 숫자 표시
                    if index == 0 {
                        Image("gold")
                            .resizable()
                            .frame(width: 35, height: 50)
                    } else if index == 1 {
                        Image("silver")
                            .resizable()
                            .frame(width: 35, height: 50)
                    } else if index == 2 {
                        Image("bronze")
                            .resizable()
                            .frame(width: 35, height: 50)
                    } else {
                        Text("\(index + 1).")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                    }

                    Image(rank.logo)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(5)
                    
                    

                    VStack(alignment: .leading, spacing: 4) {
                        Text(rank.name)
                            .font(.bold16)

                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(rank.rating)
                            Text("(\(rank.review))")
                            Divider()
                                .frame(height: 10)
                            Text("난이도:")
                            Text(rank.difficultylevel).foregroundColor(viewModel.colorForDifficulty(rank.difficultylevel))
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.all, 10)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(5)
                
                // 홈랭킹뷰 메인에서는 구분선이 보이게 하는게 자연스러울것 같음
                .if(showShadowAndSeparator) { view in
                    view
                        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden) //리스트 배경색이 안보이는게 더 깔끔해 보임
    }
}

extension View {
    @ViewBuilder func `if`<TrueContent: View>(_ condition: Bool, then: (Self) -> TrueContent) -> some View {
        if condition {
            then(self)
        } else {
            self
        }
    }
}

#Preview {
    HomeRankingListView(viewModel: HomeRankingViewModel()) // 데이터 전달
}
