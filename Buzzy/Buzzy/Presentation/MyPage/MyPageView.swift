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
                        
                        Text("열정알바")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 32)
                    
                    
                    .padding(.bottom, 20)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("지원서 관리")
                                .font(.headline)
                        }
                        .frame(width: 300, height: 40)
                        .background(.yellow)
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                    .padding(.bottom, 25)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        NavigationLink {
                            
                        } label: {
                            Text("내가 작성한 글")
                                .font(.system(size: 20))
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            Text("내가 작성한 댓글")
                                .font(.system(size: 20))
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            Text("지역 설정")
                                .font(.system(size: 20))
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            Text("알림설정")
                                .font(.system(size: 20))
                        }
                        Divider()
                        
                        
                        NavigationLink {
                            
                        } label: {
                            Text("고객센터")
                                .font(.system(size: 20))
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            Text("환경설정")
                                .font(.system(size: 20))
                        }
                        Divider()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    MyPageView()
}
