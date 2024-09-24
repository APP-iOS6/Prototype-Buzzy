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
                
                
                
                
            }
        }
    }
}

#Preview {
    MyPageView()
}
