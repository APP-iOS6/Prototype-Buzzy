//
//  MyCouponsView.swift
//  Buzzy
//
//  Created by Min on 9/25/24.
//

import SwiftUI

struct MyCouponsView: View {
    
    let coupons = [
        Coupon(title: "스타벅스 3,000원 할인 쿠폰", description: "음료 3,000원 할인 쿠폰", condition: "스타벅스 전 메뉴 대상", expiryDate: "2024.10.01까지", dDay: "D-6")
        ]

    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Button(action: {
                    
                }) {
                    Text("쿠폰 등록")
                        .foregroundColor(.red)
                }
                Spacer()
                Button(action: {
            
                }) {
                    Text("쿠폰 받기")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("내 쿠폰 보기")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(coupons) { coupon in
                        CouponCardView(coupon: coupon)
                            .padding(.horizontal)
                            .padding(.top, 8)
                    }
                }
            }
        }
        .navigationTitle("쿠폰")
    }
}

struct Coupon: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let condition: String
    let expiryDate: String
    let dDay: String
}

struct CouponCardView: View {
    let coupon: Coupon
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(coupon.title)
                .font(.headline)
                .padding(.bottom, 2)
            Text(coupon.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(coupon.condition)
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                Text(coupon.dDay)
                    .font(.caption)
                    .foregroundColor(.red)
                Spacer()
                Text(coupon.expiryDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    MyCouponsView()
}
