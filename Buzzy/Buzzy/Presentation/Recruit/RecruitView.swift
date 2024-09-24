//
//  RecruitView.swift
//  Buzzy
//
//  Created by Juno Lee on 9/24/24.
//

import SwiftUI

struct RecruitView: View {
    @State private var selectedIndex: Int = 0
    @State private var search: String = ""
    
    private let categories = ["All", "요식업", "편의점", "상하차", "카페", "피씨방", "당구장", "기타"]
    
    var filteredRecruits: [Recruit] {
        if search.isEmpty {
            return recruits
        } else {
            return recruits.filter { recruit in
                recruit.title.localizedCaseInsensitiveContains(search)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                    .font(.bold24)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        TagLineView()
                            .padding()
                        
                        SearchView(search: $search)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categories.indices, id: \.self) { index in
                                    CategoryView(isActive: index == selectedIndex, text: categories[index])
                                        .onTapGesture {
                                            selectedIndex = index
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("추천")
                            .font(.bold16)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(filteredRecruits.prefix(4)) { recruit in
                                    NavigationLink(destination: RecruitDetailView(recruit: recruit)) {
                                        RecuritCardView(image: Image(recruit.image), size: 210, title: recruit.title, hourlyWage: recruit.hourlyWage, starCount: recruit.starCount)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("단기 알바")
                            .font(.bold16)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(filteredRecruits.suffix(4)) { recruit in
                                    NavigationLink(destination: RecruitDetailView(recruit: recruit)) {
                                        RecuritCardView(image: Image(recruit.image), size: 180, title: recruit.title, hourlyWage: recruit.hourlyWage, starCount: recruit.starCount)
                                            .foregroundColor(.black)
                                    }
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
}

#Preview {
    RecruitView()
}

struct TagLineView: View {
    var body: some View {
        Text("단기 알바 모집")
            .font(.bold16)
    }
}

struct SearchView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("단기 알바 검색", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
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
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)

            if isActive {
                Color(.black)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct RecuritCardView: View {
    let image: Image
    let size: CGFloat
    let title: String
    let hourlyWage: String
    let starCount: Int
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20)
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0..<starCount, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Spacer()
                
                Text("시급: \(hourlyWage)")
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
