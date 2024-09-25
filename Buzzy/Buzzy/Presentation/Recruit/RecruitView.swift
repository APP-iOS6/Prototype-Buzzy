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
    @State private var showFilterModal: Bool = false
    @State private var selectedLocation: String = "전체 위치"
    
    private let categories = ["All", "요식업", "편의점", "상하차", "카페", "피씨방", "당구장", "기타"]
    private let locations = ["전체 위치", "서울", "부산", "대구", "광주", "인천"]
    
    var filteredRecruits: [Recruit] {
        var results = recruits
        
        
        if selectedIndex > 0 {
            let category = categories[selectedIndex]
            results = results.filter { recruit in
                if category == "카페" {
                    return recruit.title.localizedCaseInsensitiveContains("카페")
                } else if category == "편의점" {
                    return recruit.title.localizedCaseInsensitiveContains("편의점")
                } else if category == "상하차" {
                    return recruit.title.localizedCaseInsensitiveContains("상하차")
                } else if category == "피씨방" {
                    return recruit.title.localizedCaseInsensitiveContains("피씨방")
                } else if category == "당구장" {
                    return recruit.title.localizedCaseInsensitiveContains("당구")
                } else if category == "요식업" {
                    return recruit.title.localizedCaseInsensitiveContains("식당") || recruit.title.localizedCaseInsensitiveContains("요리")
                } else if category == "기타" {
                    return !["카페", "편의점", "상하차", "피씨방", "당구장", "식당", "요리"].contains(where: { recruit.title.localizedCaseInsensitiveContains($0) })
                }
                
                return false
            }
        }
        
        // 검색
        if !search.isEmpty {
            results = results.filter { recruit in
                recruit.title.localizedCaseInsensitiveContains(search)
            }
        }
        
        // 위치 필터
        if selectedLocation != "전체 위치" {
            results = results.filter { recruit in
                recruit.location.localizedCaseInsensitiveContains(selectedLocation)
            }
        }
        
        return results
    }
    
    var randomRecruits: [Recruit] {
        
        return Array(filteredRecruits.shuffled().prefix(4))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            TagLineView()
                            
                            Spacer()
                            
                            Button(action: {
                                showFilterModal.toggle()
                            }) {
                                Text("위치 필터: \(selectedLocation)")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .padding(8)
                                    .cornerRadius(5)
                            }
                            .padding(.trailing)
                        }
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
                                ForEach(randomRecruits) { recruit in
                                    NavigationLink(destination: RecruitDetailView(recruit: recruit)) {
                                        RecuritCardView(image: Image(recruit.image), size: 210, title: recruit.title, hourlyWage: recruit.hourlyWage)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("대타 알바")
                            .font(.bold16)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(filteredRecruits) { recruit in
                                    NavigationLink(destination: RecruitDetailView(recruit: recruit)) {
                                        RecuritCardView(image: Image(recruit.image), size: 180, title: recruit.title, hourlyWage: recruit.hourlyWage)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        // 전체 보기 버튼 추가
                        NavigationLink(destination: AllRecruitsView()) {
                            Text("대타 알바 전체 보기")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .cornerRadius(30)
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
            }
        }
        .sheet(isPresented: $showFilterModal) {
            FilterView(selectedLocation: $selectedLocation, showFilterModal: $showFilterModal)
        }
    }
}

struct FilterView: View {
    @Binding var selectedLocation: String
    @Binding var showFilterModal: Bool
    
    private let locations = ["전체 위치", "서울", "경기", "인천", "대구", "광주", "부산"]
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("위치 선택")) {
                    ForEach(locations, id: \.self) { location in
                        Button(action: {
                            selectedLocation = location
                            showFilterModal = false
                        }) {
                            HStack {
                                Text(location)
                                Spacer()
                                if location == selectedLocation {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("위치 필터", displayMode: .inline)
            .navigationBarItems(trailing: Button("완료") {
                showFilterModal = false
            })
        }
    }
}

#Preview {
    RecruitView()
}

struct TagLineView: View {
    var body: some View {
        Text("알바 대타 모집")
            .font(.bold24)
    }
}

struct SearchView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("알바 대타 검색", text: $search)
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
                Color.black
                    .frame(height: 2)
                    .frame(maxWidth: text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 18)]).width)
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
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20)
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
            
            HStack {
                Spacer()
                Text("시급: \(hourlyWage)")
                    .font(.caption)
                    .fontWeight(.light)
                    .padding(.trailing, 8)
            }
        }
    }
}
