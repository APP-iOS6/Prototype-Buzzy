//
//  RecuritViewModel.swift
//  Buzzy
//
//  Created by Juno Lee on 9/24/24.
//
import Foundation

struct Recruit: Identifiable {
    var id: UUID = UUID()
    var title: String
    var image: String
    var hourlyWage: String
    var starCount: Int
    var jobDescription: String
    var location: String
    var workDays: String
    var workPeriod: String
    var workHours: String
}

let recruits: [Recruit] = [
    Recruit(
        title: "스터디 카페 김가든",
        image: "StudyCafe_1",
        hourlyWage: "50,000원",
        starCount: 2,
        jobDescription: "카페 직원으로서 고객 응대 및 청소 업무",
        location: "서울시 강남구",
        workDays: "주말 포함, 탄력 근무",
        workPeriod: "1주일",
        workHours: "오전 1시 - 오후 10시"
    ),
    Recruit(
        title: "스터디 카페 2",
        image: "StudyCafe_2",
        hourlyWage: "55,000원",
        starCount: 5,
        jobDescription: "주문 접수 및 음료 제조",
        location: "서울시 송파구",
        workDays: "하루 근무",
        workPeriod: "9월 24일",
        workHours: "오전 9시 - 오후 5시"
    ),
    Recruit(
        title: "스터디 카페 3",
        image: "StudyCafe_3",
        hourlyWage: "48,000원",
        starCount: 3,
        jobDescription: "매장 관리 및 고객 서비스",
        location: "서울시 마포구",
        workDays: "하루 근무",
        workPeriod: "9월 24일",
        workHours: "오후 1시 - 오후 7시"
    ),
    Recruit(
        title: "스터디 카페 4",
        image: "StudyCafe_4",
        hourlyWage: "52,000원",
        starCount: 4,
        jobDescription: "청소 및 정리, 음료 서빙",
        location: "서울시 관악구",
        workDays: "3일",
        workPeriod: "9월 24일 ~ 9월 27일",
        workHours: "오후 3시 - 오후 11시"
    )
]
