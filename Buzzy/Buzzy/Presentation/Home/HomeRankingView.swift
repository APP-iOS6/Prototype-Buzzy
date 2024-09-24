//
//  HomeRankingView.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//

import SwiftUI

struct HomeRankingView: View {
    var body: some View {
        //홈화면에 들어갈 랭킹페이지 및 상세랭킹페이지 만들기
        VStack {
            HStack{
                //padding()
                Text("알바 랭킹").font(.subheadline)
                    
                Spacer()
                
                Button {
                    //랭킹 상세 페이지 뷰 와야함
                } label: {
                    Image(systemName: "greaterthan").foregroundStyle(Color.black)
                }

            }.padding()
        }
    }
}

#Preview {
    HomeRankingView()
}
