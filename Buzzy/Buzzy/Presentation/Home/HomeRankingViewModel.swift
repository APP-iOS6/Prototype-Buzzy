//
//  HomeRankingViewModel.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//
import Foundation
import Combine

class HomeRankingViewModel: ObservableObject {
    @Published var sortedRanks: [Rank] = RankData.ranks // 소팅해서 넘기기 위해 만든 정렬된 배열
    private var originalRanks: [Rank] = RankData.ranks // 원래 데이터

    enum SortOrder {
        case `default`, byViews, byRating
    }

    private var sortOrder: SortOrder = .default

    func sortRanks(by order: SortOrder) {
        sortOrder = order
        switch sortOrder {
        case .byViews:
            // 조회수에 따라 정렬
            sortedRanks.sort { $0.review > $1.review }
        case .byRating:
            // 평점에 따라 정렬
            sortedRanks.sort { Double($0.rating)! > Double($1.rating)! }
        case .default:
            // 기본 정렬
            sortedRanks = originalRanks
        }
    }
}
