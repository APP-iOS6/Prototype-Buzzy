//
//  Job.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import Foundation

enum PartTimeKeyWord: String,CaseIterable {
   
    case region = "강남에서 많이 봤어요"
    case highSalary = "시급이 높아요"
    case highRating = "평점이 높아요"
    case GoodMood = "분위기가 좋아요"

    
    var annoucementData: [Announcement] {
        switch self {
            
        case .GoodMood:
            [Announcement(title: "음료 제조 및 매장관리", company: "투썸 플레이스", imageName: "company6"),
             Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company5"),
             Announcement(title: "서빙 및 청소", company: "김밥천국", imageName: "company1"),
             Announcement(title: "주방 보조", company: "맘스터치", imageName: "company2")
            ]
        case .region:
            [ Announcement(title: "편의점 아르바이트", company: "CU 편의점", imageName: "company3"),
              Announcement(title: "영화관 매표소 관리", company: "CGV", imageName: "company4"),
              Announcement(title: "디저트 카페 바리스타", company: "할리스", imageName: "company8"), // 디저트 카페 이미지
              Announcement(title: "야식 배달", company: "요기요", imageName: "company7")
            ]
        case .highSalary:
            [Announcement(title: "주방 보조", company: "맘스터치", imageName: "company2"),
             Announcement(title: "편의점 아르바이트", company: "CU 편의점", imageName: "company3"),
             Announcement(title: "영화관 매표소 관리", company: "CGV", imageName: "company4"),
             Announcement(title: "디저트 카페 바리스타", company: "할리스", imageName: "company8"),]
        case .highRating:
            [   Announcement(title: "레스토랑 홀 서빙", company: "빕스", imageName: "company9"),
                Announcement(title: "서빙 및 청소", company: "김밥천국", imageName: "company1"),
                Announcement(title: "주방 보조", company: "맘스터치", imageName: "company2"),
                Announcement(title: "편의점 아르바이트", company: "CU 편의점", imageName: "company3")
            ]
        }
    }
}

struct Announcement: Identifiable {
    var id = UUID()
    let title: String
    let company: String
    let imageName: String
    
    static let annoucementData = [
        Announcement(title: "음료 제조 및 매장관리", company: "투썸 플레이스", imageName: "company6"),
        Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company5"),
        Announcement(title: "서빙 및 청소", company: "김밥천국", imageName: "company1"),
        Announcement(title: "주방 보조", company: "맘스터치", imageName: "company2"),
        Announcement(title: "편의점 아르바이트", company: "CU 편의점", imageName: "company3"),
        Announcement(title: "영화관 매표소 관리", company: "CGV", imageName: "company4"),
        Announcement(title: "디저트 카페 바리스타", company: "할리스", imageName: "company8"),
        Announcement(title: "야식 배달", company: "요기요", imageName: "company7"),
        Announcement(title: "레스토랑 홀 서빙", company: "빕스", imageName: "company9")
        
    ]
    
}
