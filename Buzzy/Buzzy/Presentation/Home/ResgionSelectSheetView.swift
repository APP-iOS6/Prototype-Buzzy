//
//  ResgionSelectSheetView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/25/24.
//

import SwiftUI

struct ResgionSelectSheetView: View {
    @State private var selectedRegion = "서울"
    @State private var selectedCategory = "전체"
    @State private var rankingCriteria = "검색순"
    
    let regions = [
        "서울",
        "인천",
        "경기",
        "부산",
        "대구",
        "광주",
        "대전",
        "울산",
        "세종"
    ]
    let categories = ["전체",""]
    let rankingOptions = [
        "실시간 급상승",
        "조회수",
        "평점",
        "난이도",
    ]

    var body: some View {
        
            VStack {
                
                HStack {
                    Picker("지역 선택", selection: $selectedRegion) {
                        ForEach(regions, id: \.self) { region in
                            Text(region)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("상세지역", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()

                
                VStack(alignment: .leading) {
                    Text("랭킹 기준 설정")
                        .font(.headline)
                    HStack {
                        ForEach(rankingOptions, id: \.self) { option in
                            Button(action: {
                                rankingCriteria = option
                            }) {
                                Text(option)
                                    .padding()
                                    .frame(width: 80, height: 80)
                                    .background(rankingCriteria == option ? Color.accentColor : .clear)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            }
                        }
                    }
                }
                .padding()
                HStack {
                    Button("초기화") {
                        selectedRegion = "서울"
                        selectedCategory = "전체"
                        rankingCriteria = "실시간 급상승"
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                    Button("결과 보기") {
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("지역 선택")
            .navigationBarTitleDisplayMode(.inline)
        }
    }


#Preview {
    ResgionSelectSheetView()
}
