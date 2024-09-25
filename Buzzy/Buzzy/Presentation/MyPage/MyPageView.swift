//
//  MyPageView.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        
        NavigationStack {
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
                                .font(.bold24)
                                .fontWeight(.bold)
                            
                            Text("성동구")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 18)
                    
                    
                    HStack(alignment: .center) {
                            
                            Spacer()
                        
                            VStack(alignment: .center) {
                                Text("지원 완료")
                                    .font(.system(size: 16, weight: .regular))
                                 
                                Text("1")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                            
                            Divider()
                                .frame(width: 1, height: 30)
                            
                        NavigationLink(destination: MyWalletPointView()) {
                            VStack(alignment: .center) {
                                Text("포인트")
                                    .font(.system(size: 16, weight: .regular))
                                Text("15,000 P")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                            Divider()
                                .frame(width: 1, height: 30)
                            
                        NavigationLink(destination: MyCouponsView()) {
                            VStack(alignment: .center) {
                                Text("쿠폰")
                                    .font(.system(size: 16, weight: .regular))
                                Text("1")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                            
                            Spacer()
                        }
                        .frame(width: 370, height: 60) // 전체 너비는 넓음
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    .padding(.bottom, 25)
                    
                    VStack(alignment: .leading, spacing: 22) {
                        
                        
                        NavigationLink {
                            ProfileDetailsView()
                        } label: {
                            Text("이력서 관리")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        
                        NavigationLink {
                            MyPostsView()
                        } label: {
                            Text("내가 작성한 글")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        NavigationLink {
                            MyCommentsView()
                        } label: {
                            Text("내가 작성한 댓글")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        NavigationLink {
                            MyWalletPointView()
                        } label: {
                            Text("지갑 포인트")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        NavigationLink {
                            LocationSettingsView()
                        } label: {
                            Text("지역 설정")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Text("환경설정")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("마이 페이지")
        .padding(.horizontal, 15)
    }
}

#Preview {
    MyPageView()
}
