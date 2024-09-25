//
//  HomeRankingViewModel.swift
//  Buzzy
//
//  Created by wonhoKim on 9/24/24.
//
import Foundation
import Combine
import SwiftUICore

class HomeRankingViewModel: ObservableObject {
    @Published var sortedRanks: [Rank] = RankData.ranks // 소팅해서 넘기기 위해 만든 정렬된 배열
    private var originalRanks: [Rank] = RankData.ranks // 원래 데이터

    enum SortOrder {
        case `default`, byViews, byRating , byDifficulty , byEasy
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
            // 난이도 높은순
        case .byDifficulty:
            sortedRanks.sort { difficultyScore($0.difficultylevel) > difficultyScore($1.difficultylevel) }
            // 난이도 높은순
        case .byEasy:
            sortedRanks.sort { difficultyScore($0.difficultylevel) < difficultyScore($1.difficultylevel) }
            
        case .default:
            // 기본 정렬
            sortedRanks = originalRanks
        }
    }
    
    private func difficultyScore(_ level: String) -> Int {
        switch level {
        case "상":
            return 3
        case "중":
            return 2
        case "하":
            return 1
        default:
            return 0
        }
    }
    
    func colorForDifficulty(_ level: String) -> Color {
            switch level {
            case "상":
                return .red
            case "중":
                return .orange
            case "하":
                return .green
            default:
                return .gray
            }
        }
}
