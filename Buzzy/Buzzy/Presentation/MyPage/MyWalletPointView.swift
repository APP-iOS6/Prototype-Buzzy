//
//  MyWalletPointView.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI

struct MyWalletPointView: View {
    
    @State private var currentPoints: Int = 15000
    @State private var selectedView: String = "포인트 내역"
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var selectedReward: (String, Int)? = nil // 선택한 보상 저장
    
    let transactionHistory = [
        ("편의점 알바", "+ 5000", "2024-09-22"),
        ("카페 알바", "+ 3000", "2024-09-20"),
        ("스타벅스 쿠폰 교환", "- 4000", "2024-09-18"),
        ("이디야 커피 쿠폰 교환", "- 3000", "2024-09-15")
    ]
    
    let rewards = [
        ("스타벅스 쿠폰", 4000),
        ("이디야 커피 쿠폰", 3000),
        ("문화상품권", 10000)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("현재 포인트")
                    .font(.semibold16)
                    .foregroundStyle(.black)
                Spacer()
                Text("\(currentPoints) P")
                    .font(.semibold24)
                    .foregroundColor(.black)
            }
            .padding()
            .background(.buzzySky)
            .cornerRadius(10)
            
            Picker("선택", selection: $selectedView) {
                Text("포인트 내역").tag("포인트 내역")
                Text("보상 교환").tag("보상 교환")
            }
            .padding()
            .pickerStyle(.segmented)
            .background(.accent)
            .cornerRadius(10)
            
            if selectedView == "포인트 내역" {
                
                Text("포인트 적립/사용 내역")
                    .font(.semibold20)
                
                
                    ForEach(transactionHistory, id: \.0) { transaction in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(transaction.0)
                                        .font(.regular16)
                                    Text(transaction.2)
                                        .font(.regular14)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(transaction.1)
                                    .font(.subheadline)
                                    .foregroundColor(transaction.1.contains("+") ? .red : .blue)
                            }
                            Divider()
                                .padding(.vertical, 8)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
//                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                
            } else if selectedView == "보상 교환" {

                Text("보상 교환")
                    .font(.semibold20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(rewards, id: \.0) { reward in
                            VStack {
                                Text(reward.0)
                                    .font(.semibold12)
                                    .padding(.bottom, 1)
                                Text("\(reward.1) P")
                                    .font(.regular14)
                                    .foregroundColor(.gray)
                                Button(action: {
                                    // 교환 확인을 위해 선택한 보상 저장
                                    selectedReward = reward
                                    showAlert = true
                                }) {
                                    Text("교환")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 24)
                                        .background(currentPoints >= reward.1 ? .accent : Color.gray) // 포인트에 따라 색상 변경
                                        .cornerRadius(10)
                                }
                                .disabled(currentPoints < reward.1)
                            }
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
            
            HStack {
                Button(action: {
                    print("포인트 충전")
                    currentPoints += 1000
                }) {
                    Text("포인트 충전")
                        .font(.semibold16)
                        .foregroundColor(.white)
                        .padding()
                        .background(.accent)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    print("포인트 사용")
                }) {
                    Text("포인트 사용")
                        .font(.bold16)
                        .foregroundColor(.white)
                        .padding()
                        .background(.buzzySky)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        // 교환 여부를 묻는 Alert
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("보상 교환"),
                message: Text("\(selectedReward?.0 ?? "")을(를) 교환하시겠습니까?"),
                primaryButton: .default(Text("교환"), action: {
                    if let reward = selectedReward, currentPoints >= reward.1 {
                        currentPoints -= reward.1
                        alertMessage = "\(reward.0)을(를) 성공적으로 교환했습니다!"
                    } else {
                        alertMessage = "포인트가 부족합니다."
                    }
                }),
                secondaryButton: .cancel(Text("취소"))
            )
        }
        .padding(.horizontal)
        .navigationTitle("지갑 포인트")
    }
}

#Preview {
    MyWalletPointView()
}
