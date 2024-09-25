//
//  HomeRankingView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//

import SwiftUI

//현재 홈 화면쪽에 지역설정 시트가 있는데 더보기 쪽으로 옮길 예정인데, 시트를 사용할지 안할지 의견부탁드립니다

struct CompanyRankingView: View {
    var body: some View {
        VStack {
            HStack {
                Text("알바랭킹")
                    .font(.semibold16)
                    .padding(.leading)
                Spacer()
                NavigationLink(destination: HomeRankingDetailView()) {
                    HStack {
                        Text("더보기")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .foregroundColor(.gray)
                
                }
                .padding(.leading)
            }
            
            HStack {
                Image("gold")
                    .resizable()
                    .frame(width: 35, height: 50)
                Image("mcdonaldLogo")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 4) {
                    Text("맥도날드 용인 수지 DT")
                        .font(.bold16)
                        .padding(.bottom,5)
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.3")
                        Text("(512)")
                        Divider()
                            .frame(height: 10)
                        Text("난이도:")
                        Text("상")
                            .foregroundStyle(.red)
    
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal, 10)
            HStack {
                Image("silver")
                    .resizable()
                    .frame(width: 35, height: 50)
                Image("riaLogo")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 4) {
                    Text("롯데리아 학동역점")
                        .font(.bold16)
                        .padding(.bottom,5)

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("2.5")
                        Text("(1047)")
                        Divider()
                            .frame(height: 10)
                        Text("난이도:")
                        Text("중")
                            .foregroundStyle(.accent)
    
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(10)
            
            HStack {
                Image("bronze")
                    .resizable()
                    .frame(width: 35, height: 50)
                Image("momsLogo")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 4) {
                    Text("맘스터치 광화문점")
                        .font(.bold16)
                        .padding(.bottom,5)

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("18")
                        Text("(222)")
                        Divider()
                            .frame(height: 10)
                        Text("난이도:")
                        Text("하")
                            .foregroundStyle(.green)
    
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
            
        }
        //.padding()
    }
    
}
#Preview("rank") {
    CompanyRankingView()
}
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
                        .font(.semibold16)
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeRankingDetailView()) {
                        HStack {
                            Text("더보기")
                                .font(.subheadline)
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                //코드 줄이고 싶다
               
                    HStack {
//                        Button {
//                            isSheetPresented.toggle()
//                        } label: {
//                            Image(systemName: "gearshape")
//                        }
//                        .sheet(isPresented: $isSheetPresented) {
//                            ResgionSelectSheetView().presentationDetents([.fraction(2/5)])
//                        }

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
