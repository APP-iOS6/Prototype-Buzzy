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
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        
                        HStack(spacing: 16) {
                            Image("1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.black, lineWidth: 1))
                                .padding(.leading, 5)
                            
                            VStack(alignment: .leading) {
                                Text("마동석")
                                    .font(.bold24)
                                
                                Text("성동구")
                                    .font(.regular14)
                                    .foregroundColor(Color(.systemGray5))
                            }
                        }
                        .padding(.leading, 5)
                        .padding(.top, 32)
                        .padding(.bottom, 18)
                        
                        
                        HStack(alignment: .center, spacing: 0) {
                            Spacer()
                            
                            VStack(alignment: .center) {
                                Text("지원 완료")
                                    .font(.semibold16)
                                
                                Text("1")
                                    .font(.semibold16)
                            }
                            .foregroundColor(.black)
                            .padding()

                            Spacer()

                            Divider()
                                .frame(width: 1, height: 30)

                            Spacer()

                            NavigationLink(destination: MyWalletPointView()) {
                                VStack(alignment: .center) {
                                    Text("포인트")
                                        .font(.semibold16)
                                    Text("15,000 P")
                                        .font(.semibold16)
                                }
                                .foregroundColor(.black)
                                .padding()
                            }

                            Spacer()

                            Divider()
                                .frame(width: 1, height: 30)

                            Spacer()

                            NavigationLink(destination: MyCouponsView()) {
                                VStack(alignment: .center) {
                                    Text("쿠폰")
                                        .font(.semibold16)
                                    Text("1")
                                        .font(.semibold16)
                                }
                                .foregroundColor(.black)
                                .padding()
                            }

                            Spacer()
                        }
                        .frame(width: 350, height: 60)
                        .background(.buzzySky)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(.bottom, 3)
                        .padding(.leading, 9)

                        HStack {
                            Spacer()
                            VStack {
                                Text("좋아요")
                                    .font(.semibold16)
                                    .foregroundColor(.white)
                                Text("3")
                                    .font(.semibold16)
                                .foregroundColor(.white)
                            }
                            
                            Spacer()
                            Divider()
                            Spacer()
                            VStack {
                                Text("스크랩")
                                    .font(.semibold16)
                                    .foregroundColor(.white)
                                Text("5")
                                    .font(.semibold16)
                                .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding(.bottom, 5)
                    }
                    .frame(width: .infinity)
                    .background(.accent)
                    .cornerRadius(15)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 22) {
                        
                        
                        NavigationLink {
                            ProfileDetailsView()
                        } label: {
                        Image(systemName: "person.fill")
                            Text("이력서 관리")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        .padding(.top, 10)
                        Divider()
                        
                        
                        NavigationLink {
                            MyPostsView()
                        } label: {
                            Image(systemName: "doc.text.fill")
                            Text("내가 작성한 글")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        NavigationLink {
                            MyCommentsView()
                        } label: {
                            Image(systemName: "text.bubble.fill")
                            Text("내가 작성한 댓글")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        NavigationLink {
                            MyWalletPointView()
                        } label: {
                            Image(systemName: "creditcard.fill")
                            Text("지갑 포인트")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        NavigationLink {
                            LocationSettingsView()
                        } label: {
                            Image(systemName: "location.fill")
                            Text("지역 설정")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                        Divider()
                        
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                            Text("환경설정")
                                .font(.regular20)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
            Spacer()
        }
        .navigationTitle("마이 페이지")
    }
}

#Preview {
    MyPageView()
}
