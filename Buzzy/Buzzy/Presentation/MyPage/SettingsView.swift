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
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            TextField("검색어를 입력하세요", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                print("공지사항 진입")
            } label: {
                Text("공지사항")
                    .font(.semibold20)
            }
            .frame(width: 340, height: 50)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            Button {
                print("이용약관 진입")
            } label: {
                Text("이용약관")
                    .font(.semibold20)
            }
            .frame(width: 340, height: 50)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            Button {
                print("계정 설정 진입")
            } label: {
                Text("계정설정")
                    .font(.semibold20)
            }
            .frame(width: 340, height: 50)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            Button {
                print("고객센터 진입")
            } label: {
                Text("고객센터")
                    .font(.semibold20)
            }
            .frame(width: 340, height: 50)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            
            Button(action: {
                showAlert = true
            }) {
                Text("로그아웃")
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
            Spacer()
        }
            .navigationTitle("환경설정")
            .padding(.horizontal, 20.0)
            .padding(.top, 10)
    }
}



#Preview {
    SettingsView()
}
