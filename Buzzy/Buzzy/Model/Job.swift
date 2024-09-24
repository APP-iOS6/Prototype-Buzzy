//
//  Job.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import Foundation

enum PartTimeKeyWord: String {
    case GoodMood = "분위기가 좋아요"
    case region = "에서 많이 봤어요"
    case highSalary = "시급이 높아요"
    case highRating = "평점이 높아요"
}

struct Announcement: Identifiable {
    var id = UUID()
    let title: String
    let company: String
    let imageName: String
    
    static let annoucementData = [
        Announcement(title: "음료 제조 및 매장관리", company: "투썸 플레이스", imageName: "company6"),
        Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company5"),
        Announcement(title: "음료 제조 및 매장관리", company: "투썸 플레이스", imageName: "company7"),
        Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company8"),
        Announcement(title: "음료 제조 및 매장관리", company: "투썸 플레이스", imageName: "company1"),
        Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company2"),
        Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company3"),
        Announcement(title: "사옥 입장관리", company: "JTBC", imageName: "company4")
    ]
    
}
