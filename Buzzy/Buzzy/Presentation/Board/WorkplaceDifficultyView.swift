//
//  WorkplaceDifficultyView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct WorkplaceDifficultyView: View {
    @Binding var workplaces: [(imageName: String, title: String, subtitle: String)]
    @Binding var showingDifficultyExplanation: Bool
    @Binding var tooltipPosition: CGPoint
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("업무 난이도") // .font(.bold24)
                TooltipButton(showTooltip: $showingDifficultyExplanation, updatePosition: { tooltipPosition = $0 })
            }
            .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(workplaces.indices, id: \.self) { index in
                        WorkplaceCard(
                            imageName: workplaces[index].imageName,  // 이미지 적용
                            title: workplaces[index].title,          // 제목 적용
                            description: workplaces[index].subtitle, // 부제목 적용
                            onTitleChange: { newTitle in
                                workplaces[index].title = newTitle
                            },
                            onSubtitleChange: { newSubtitle in
                                workplaces[index].subtitle = newSubtitle
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct WorkplaceDifficultyView_Previews: PreviewProvider {
    @State static var workplaces: [(imageName: String, title: String, subtitle: String)] = [
        ("Emart", "이마트", "이마트 물류센터"),
        ("Cu", "CU", "편의점"),
        ("Coupang", "쿠팡", "쿠팡 물류센터"),
        ("HanamPig", "하남돼지집", "하남돼지집 강남점"),
        ("HongkongBanjum", "홍콩반점", "홍콩반점 서초점"),
        ("Starbucks", "스타벅스", "스타벅스 서초점"),
        ("Uniqlo", "유니클로", "유니클로 강남점")
    ]
    
    @State static var showingDifficultyExplanation = false
    @State static var tooltipPosition: CGPoint = .zero
    
    static var previews: some View {
        WorkplaceDifficultyView(
            workplaces: $workplaces,
            showingDifficultyExplanation: $showingDifficultyExplanation,
            tooltipPosition: $tooltipPosition
        )
    }
}
