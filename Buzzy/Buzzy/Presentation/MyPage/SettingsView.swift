//
//  SettingsView.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var showAlert = false
    @State private var isLoggedOut = false
    @State private var searchText: String = ""
    
    let menuItems = [
        "공지사항",
        "이용약관",
        "계정설정",
        "고객센터",
        "알림설정",
        "로그아웃"
    ]
    
    var filteredMenuItems: [String] {
        if searchText.isEmpty {
            return menuItems
        } else {
            return menuItems.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
//            HStack {
//                Image(systemName: "magnifyingglass")
//                TextField("검색어를 입력하세요", text: $searchText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                if !searchText.isEmpty {
//                    Button(action: {
//                        searchText = ""
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .foregroundStyle(.gray)
//
//                    }
//                }
//
//            }
//            .padding(3)
            
            ForEach(filteredMenuItems, id: \.self) { item in
                if item == "로그아웃" {
                    Button(action: {
                        showAlert = true
                    }) {
                        Text(item)
                            .font(.semibold20)
                            .frame(width: 340, height: 50)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("로그아웃 확인"),
                            message: Text("현재 접속중인 계정에서 로그아웃 됩니다."),
                            primaryButton: .destructive(Text("로그아웃")) {
                                isLoggedOut = true
                                print("로그아웃됨")
                            },
                            secondaryButton: .cancel {
                                print("취소")
                            }
                        )
                    }
                } else {
                    Button(action: {
                        print("\(item) 진입")
                    }) {
                        Text(item)
                            .font(.semibold20)
                    }
                    .frame(width: 340, height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    
                }
            }
            Spacer()
            .navigationTitle("환경설정")
            
        }
        .padding(.horizontal)
        .padding(.top, 40)
    }
    
}

#Preview {
    SettingsView()
}
