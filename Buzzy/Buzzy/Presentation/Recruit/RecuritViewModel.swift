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
    var jobDescription: String
    var location: String
    var workPeriod: String
    var workHours: String
}

let recruits: [Recruit] = [
    Recruit(
        title: "스터디 카페 김가든",
        image: "StudyCafe_1",
        hourlyWage: "50,000원",
        jobDescription: "카페 직원으로서 고객 응대 및 청소 업무",
        location: "서울시 강남구 역삼동",
        workPeriod: "9월 24 ~ 9월 30일",
        workHours: "오전 1시 - 오후 10시"
    ),
    Recruit(
        title: "스터디 카페 2",
        image: "StudyCafe_2",
        hourlyWage: "5500원",
        jobDescription: "주문 접수 및 음료 제조",
        location: "부산시 사상구",
        workPeriod: "9월 24일",
        workHours: "오전 9시 - 오후 5시"
    ),
    Recruit(
        title: "가든 피씨방",
        image: "StudyCafe_3",
        hourlyWage: "4800원",
        jobDescription: "매장 관리 및 고객 서비스",
        location: "인천광역시 동구",
        workPeriod: "9월 24일",
        workHours: "오후 1시 - 오후 7시"
    ),
    Recruit(
        title: "스터디 카페 3 ",
        image: "StudyCafe_4",
        hourlyWage: "5200원",
        jobDescription: "청소 및 정리, 음료 서빙",
        location: "서울시 관악구",
        workPeriod: "9월 24일 ~ 9월 27일",
        workHours: "오후 3시 - 오후 11시"
    ),
    Recruit(
        title: "GS25 편의점",
        image: "Store_1",
        hourlyWage: "4200원",
        jobDescription: "재고 관리 및 고객 서비스",
        location: "대구광역시 서구",
        workPeriod: "9월 25일 ~ 10월 5일",
        workHours: "오후 5시 - 오전 1시"
    ),
    Recruit(
        title: "한식당",
        image: "KoreanRestaurant_1",
        hourlyWage: "4500원",
        jobDescription: "주방 보조 및 서빙",
        location: "서울시 송파구",
        workPeriod: "9월 26일 ~ 10월 5일",
        workHours: "오후 5시 - 오전 12시"
    ),
    Recruit(
        title: "쿠팡 상하차 알바",
        image: "LoadingUnload_1",
        hourlyWage: "6000원",
        jobDescription: "화물 상하차 작업",
        location: "경기도 수원시",
        workPeriod: "9월 25일",
        workHours: "오전 8시 - 오후 4시"
    ),
    Recruit(
        title: "당구장 직원",
        image: "BilliardHall_1",
        hourlyWage: "4000원",
        jobDescription: "고객 응대 및 매장 관리",
        location: "부산시 사하구",
        workPeriod: "9월 24일 ~ 10월 1일",
        workHours: "오후 6시 - 오전 2시"
    ),
    Recruit(
        title: "기타 아르바이트",
        image: "OtherJob_1",
        hourlyWage: "3800원",
        jobDescription: "가게 보조 및 현장 지원",
        location: "서울시 중구",
        workPeriod: "9월 27일",
        workHours: "오전 10시 - 오후 5시"
    )
]
