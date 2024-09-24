//
//  RecruitView.swift
//  Buzzy
//
//  Created by Juno Lee on 9/24/24.
//

import SwiftUI

struct RecruitView: View {
    @State private var selectedIndex : Int = 0
    private let categories = ["All", "요식업", "편의점", "상하차","카페", "피씨방","당구장","기타"]
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
                .font(.bold24)
            
            ScrollView {
                VStack (alignment: .leading) {
                    AppBarView()
                    
                    TagLineView()
                        .padding()
                    
                    SearchView()
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< categories.count) { i in
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                        .padding()
                    }
                    Text("추천")
                        .font(.bold16)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal,  showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("StudyCafe_\(index + 1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("단기 알바")
                        .font(.bold16)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView (.horizontal,  showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("StudyCafe_\(4 - index)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                }
            }
            
            
        }
    }
}

#Preview {
    RecruitView()
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}) {
                Image(systemName: "line.3.horizontal")
                    .padding()
                //change to grayColor
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "person.crop.circle")
                    .padding()
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("단기 알바 모집")
            .font(.bold16)
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("단기 알바 검색", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
   
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
            // .foregroundColor(isActive ? .gray: Color.black.opacity(0.5)
            
            if (isActive) { Color(.black)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image : Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            Text("스터디 카페 김가든")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2){
                ForEach(0 ..< 1) { item in
                    Image(systemName: "star.fill")
                    // change color to yellow
                        .foregroundColor(.yellow)
                    
                }
                Spacer()
                
                Text ("시급: 50,000원 / 1시간")
                    .font(.caption)
                    .fontWeight(.light)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}
