//
//  BoardSearchView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/26/24.
//

import SwiftUI

struct BoardSearchView: View {
    @Binding var isSearchViewActive: Bool
    @State private var searchText: String = ""
    @State private var isRecentSearchEnabled: Bool = false

    var body: some View {
        VStack {
            // 상단 검색어 입력란
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundColor(.gray.opacity(0.5))
                
                TextField("검색어를 입력하세요", text: $searchText)
                    .font(.regular14)
                    .padding(.trailing, 8)

                // 검색어가 있을 때 X 버튼 표시
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = "" // 검색어 초기화
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(.vertical, 8)
            .background(Color(.buzzyWhite))
            .cornerRadius(8)
            .padding(.horizontal)

            Spacer()

            // 검색어가 없을 때 타이머 심볼과 텍스트 표시
            if searchText.isEmpty {
                VStack {
                    Image(systemName: "timer")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)

                    Text(isRecentSearchEnabled ? "최근 검색어 내역이 없습니다." : "최근 검색어 기능이 꺼져 있습니다.")
                        .font(.regular12)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }

            Spacer()

            // 왼쪽 하단에 최근 검색어 켜기/끄기 버튼
            HStack {
                Button(action: {
                    isRecentSearchEnabled.toggle() // 최근 검색어 기능 토글
                }) {
                    Text(isRecentSearchEnabled ? "최근 검색어 끄기" : "최근 검색어 켜기")
                        .font(.semibold16)
                        .foregroundColor(.accentColor)
                }
                .padding(.leading, 20)

                Spacer()
            }
        }
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            isSearchViewActive = false // 뒤로 가기 동작
        }) {
            Image(systemName: "chevron.left")
                .font(.semibold16)
        })
    }
}

struct BoardSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BoardSearchView(isSearchViewActive: .constant(true))
        }
    }
}
