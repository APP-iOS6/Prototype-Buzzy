//
//  WorkplaceCard.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct WorkplaceCard: View {
    let imageName: String
    let title: String
    let description: String
    let onTitleChange: (String) -> Void
    let onSubtitleChange: (String) -> Void
    
    // 회사별 별점을 관리하는 딕셔너리
    private let companyStars: [String: Int] = [
        "스타벅스": 3,
        "이마트": 2,
        "CU": 1,
        "쿠팡": 3,
        "하남돼지집": 2,
        "홍콩반점": 1,
        "유니클로": 1
    ]
    
    // 현재 회사의 별점을 계산하는 계산 속성
    private var starCount: Int {
        companyStars[title] ?? 0
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            if let uiImage = UIImage(named: imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .padding(.bottom, 6)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 70)
                    .foregroundColor(.gray)
                    .padding(.bottom, 6)
            }
            
            Text(title)
                .font(.bold16)
                .multilineTextAlignment(.center)
                .padding(.bottom, -2)
            
            Text(description)
                .font(.semibold12)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 5) {
                ForEach(0..<3) { index in
                    Image(systemName: index < starCount ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
            }
        }
        .frame(width: 110, height: 165)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

struct WorkplaceCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkplaceCard(
                imageName: "Starbucks",
                title: "스타벅스",
                description: "스타벅스 매장",
                onTitleChange: { _ in },
                onSubtitleChange: { _ in }
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

