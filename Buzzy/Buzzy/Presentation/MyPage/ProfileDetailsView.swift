//
//  Untitled.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct ProfileDetailsView: View {
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                HStack(spacing: 16) {
                    Image("1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.black, lineWidth: 1))
                        .padding(.leading, 5)
                    
                    VStack(alignment: .leading) {
                        Text("마동석")
                            .font(.system(size: 22, weight: .bold))
                        Text("남성·53세·성동구")
                    }
                }
                .padding(.top, 32)
                Divider()
                    .padding(.bottom, 20)
                
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("자기 소개")
                        .font(.title)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("자기소개 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.title3)
                                .frame(width: 340, height: 50)
                                .background(.yellow)
                                .cornerRadius(10)                            
                        }
                        Spacer()
                    }
                    Text("Tip 50자 이상 작성하면 채용될 확률이 15% 올라요!")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                    Divider()
                    
                    
                    Text("경력 0")
                        .font(.title)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("경력 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.title3)
                                .frame(width: 340, height: 50)
                                .background(.yellow)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    Text("Tip 1개만 작성해도 채용될 확률이 올라요!")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                    Divider()
                    
                    
                   Text("나의 장점")
                        .font(.title)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("나의 장점 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.title3)
                                .frame(width: 340, height: 50)
                                .background(.yellow)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    Divider()
                    
                    
                    Text("추가 정보")
                        .font(.title)
                    
                    Text("예) 보건증, 운전면허, 장기근무 가능 여부 등")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("추가 정보 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.title3)
                                .frame(width: 340, height: 50)
                                .background(.yellow)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
            .navigationTitle("지원서 관리")
            .padding(.horizontal, 24.0)
        }
    }
}

#Preview {
    ProfileDetailsView()
}
