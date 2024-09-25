//
//  HomeRankingView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//

import SwiftUI

struct HomeRankingView: View {
    
    @StateObject private var viewModel = HomeRankingViewModel()
    @State private var selectedButton: Int = 0
    //임시색상
    let customGray = Color(red: 68 / 255, green: 68 / 255, blue: 68 / 255)
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {

                    Text("알바 랭킹")
                        .font(.bold24)
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeRankingDetailView()) {
                        HStack {
                            Text("더보기")
                                .font(.headline)
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                //코드 줄이고 싶다
                ScrollView(.horizontal){
                    HStack {
                        
                        Button("조회수 급상승") {
                            selectedButton = 0 // 첫 번째 버튼 선택
                            viewModel.sortRanks(by: .byViews) // 조회수로 정렬
                        }
                        .padding(5)
                        .background(selectedButton == 0 ? customGray : Color.clear) // 선택된 경우 검정색 배경
                        .foregroundColor(selectedButton == 0 ? .white : .black) // 선택된 경우 흰색 글자
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        Button("평점순") {
                            selectedButton = 1 // 두 번째 버튼 선택
                            viewModel.sortRanks(by: .byRating) // 평점순으로 정렬
                        }
                        .padding(5)
                        .background(selectedButton == 1 ? customGray : Color.clear)
                        .foregroundColor(selectedButton == 1 ? .white : .black)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        Button("리뷰순") {
                            selectedButton = 2
                            viewModel.sortRanks(by: .byViews) // 조회수랑 같게 함
                        }
                        .padding(5)
                        .background(selectedButton == 2 ? customGray : Color.clear)
                        .foregroundColor(selectedButton == 2 ? .white : .black)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        Button("난이도 높은순") {
                            selectedButton = 3
                            viewModel.sortRanks(by: .byDifficulty) // 조회수랑 같게 함
                        }
                        .padding(5)
                        .background(selectedButton == 3 ? customGray : Color.clear)
                        .foregroundColor(selectedButton == 3 ? .white : .black)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        Button("난이도 낮은순") {
                            selectedButton = 4
                            viewModel.sortRanks(by: .byEasy) // 조회수랑 같게 함
                        }
                        .padding(5)
                        .background(selectedButton == 4 ? customGray : Color.clear)
                        .foregroundColor(selectedButton == 4 ? .white : .black)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                }
                
                // 랭킹 리스트 뷰
                HomeRankingListView(viewModel: viewModel, showShadowAndSeparator: false)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeRankingView()
}
