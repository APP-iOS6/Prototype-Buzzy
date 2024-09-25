//
//  HomeRankingView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//

import SwiftUI

//현재 홈 화면쪽에 지역설정 시트가 있는데 더보기 쪽으로 옮길 예정인데, 시트를 사용할지 안할지 의견부탁드립니다
struct HomeRankingView: View {
    
    @StateObject private var viewModel = HomeRankingViewModel()
    @State private var selectedButton: Int = 0
    @State private var isSheetPresented = false
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
               
                    HStack {
                        Button {
                            isSheetPresented.toggle()
                        } label: {
                            Image(systemName: "gearshape")
                        }
                        .sheet(isPresented: $isSheetPresented) {
                            ResgionSelectSheetView().presentationDetents([.fraction(2/5)])
                        }

                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                Button("조회수 급상승") {
                                    selectedButton = 0
                                    viewModel.sortRanks(by: .byViews) // 조회수로 정렬
                                }
                                .padding(5)
                                .background(selectedButton == 0 ? Color.accentColor : Color.clear)
                                .foregroundColor(selectedButton == 0 ? .white : .black)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                                
                                Button("평점순") {
                                    selectedButton = 1
                                    viewModel.sortRanks(by: .byRating)
                                }
                                .padding(5)
                                .background(selectedButton == 1 ? Color.accentColor : Color.clear)
                                .foregroundColor(selectedButton == 1 ? .white : .black)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                                
                                Button("리뷰순") {
                                    selectedButton = 2
                                    viewModel.sortRanks(by: .byViews) // 조회수랑 같게 함
                                }
                                .padding(5)
                                .background(selectedButton == 2 ? Color.accentColor : Color.clear)
                                .foregroundColor(selectedButton == 2 ? .white : .black)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                                
                                Button("난이도 높은순") {
                                    selectedButton = 3
                                    viewModel.sortRanks(by: .byDifficulty) // 조회수랑 같게 함
                                }
                                .padding(5)
                                .background(selectedButton == 3 ? Color.accentColor : Color.clear)
                                .foregroundColor(selectedButton == 3 ? .white : .black)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                                
                                Button("난이도 낮은순") {
                                    selectedButton = 4
                                    viewModel.sortRanks(by: .byEasy) // 조회수랑 같게 함
                                }
                                .padding(5)
                                .background(selectedButton == 4 ? Color.accentColor : Color.clear)
                                .foregroundColor(selectedButton == 4 ? .white : .black)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                
                
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
