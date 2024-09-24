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
    let onCardSelected: (Int) -> Void

    private let companyStars: [String: Int] = [
        "유니클로": 2,
        "이마트": 3,
        "CU": 2,
        "스타벅스": 4,
        "하남돼지집": 3,
        "홍콩반점": 2,
        "쿠팡": 5
    ]
    
    private var starCount: Int {
        companyStars[title] ?? 0
    }
    
    public var body: some View {
        Button(action: {
            onCardSelected(starCount)
        }) {
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
                
                HStack(spacing: 1) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < starCount ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .font(.regular12)
            .frame(width: 110, height: 165)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
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
                onSubtitleChange: { _ in },
                onCardSelected: { _ in }
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

