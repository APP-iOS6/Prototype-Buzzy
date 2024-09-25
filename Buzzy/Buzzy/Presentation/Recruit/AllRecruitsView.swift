//
//  AllRecruitsView.swift
//  Buzzy
//
//  Created by Juno Lee on 9/25/24.
//

import SwiftUI

struct AllRecruitsView: View {
    var body: some View {
        List(recruits) { recruit in
            NavigationLink(destination: RecruitDetailView(recruit: recruit)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(recruit.title)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text("시급: \(recruit.hourlyWage)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(recruit.location)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 10)
                    .padding(.trailing, 10)
                    
                    Spacer()
                    
                    Image(recruit.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(15)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 4)
                .padding(.vertical, 4)
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(PlainListStyle())
        .navigationTitle("모든 대타 알바")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AllRecruitsView()
}

