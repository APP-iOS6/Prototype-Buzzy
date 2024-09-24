//
//  WorkplaceDifficultyDetailView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

struct WorkplaceDifficultyDetailView: View {
    let workplace: (imageName: String, title: String, subtitle: String)
    @State private var rating: Int
    @Environment(\.presentationMode) var presentationMode
    
    init(workplace: (imageName: String, title: String, subtitle: String), rating: Int) {
        self.workplace = workplace
        _rating = State(initialValue: rating)  // 받아온 별점으로 초기화
    }
    

    @State private var imageWidth: CGFloat = 300 
    @State private var imageHeight: CGFloat = 200
    
    let hourlyWorkload: [TimeBlock] = [
        TimeBlock(startTime: "00시", endTime: "04시", workload: "한산", emoji: "🌙", color: Color(red: 0.1, green: 0.1, blue: 0.3).opacity(0.7)),
        TimeBlock(startTime: "04시", endTime: "08시", workload: "한산", emoji: "🌅", color: Color.blue.opacity(0.3)),
        TimeBlock(startTime: "08시", endTime: "12시", workload: "보통", emoji: "🌞", color: Color.yellow.opacity(0.7)),
        TimeBlock(startTime: "12시", endTime: "16시", workload: "혼잡", emoji: "☀️", color: Color.orange.opacity(0.7)),
        TimeBlock(startTime: "16시", endTime: "20시", workload: "혼잡", emoji: "🌄", color: Color.red.opacity(0.7)),
        TimeBlock(startTime: "20시", endTime: "00시", workload: "보통", emoji: "🌃", color: Color(red: 0.2, green: 0.2, blue: 0.4).opacity(0.7))
    ]
    
    init(workplace: (imageName: String, title: String, subtitle: String)) {
        self.workplace = workplace
        _rating = State(initialValue: 0)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    imageView
                    workplaceInfoView
                    Divider()
                    ratingView
                    Divider()
                    workloadChartView
                        .padding(30)
                    workloadDetailsView
                    Spacer()
                }
            }
            backButton
        }
        .navigationBarBackButtonHidden(true)  // 기본 네비게이션 백버튼 숨기기
    }
    
    
    private var imageView: some View {
        Image(workplace.imageName)
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 1)
    }
    
    private var workplaceInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(workplace.title)
                .font(.bold24)
                .fontWeight(.bold)
            Text(workplace.subtitle)
                .font(.regular16)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
    
    private var ratingView: some View {
        HStack {
            Text("난이도 :")
                .font(.bold16)
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.semibold16)
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
        .padding(.horizontal)
    }
    
    private var workloadChartView: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                ForEach(hourlyWorkload.indices, id: \.self) { index in
                    WorkloadArc(startAngle: self.startAngle(for: index),
                                endAngle: self.endAngle(for: index))
                    .fill(hourlyWorkload[index].color)
                    .stroke(Color.white, lineWidth: 9)
                }
                
                ForEach(hourlyWorkload.indices, id: \.self) { index in
                    Text(hourlyWorkload[index].emoji)
                        .font(.system(size: 20))
                        .offset(self.emojiOffset(for: index))
                }
                
                Text("시간 별\n업무 강도")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            .frame(height: 260)
        }
        .padding(.horizontal)
    }
    
    private var workloadDetailsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(hourlyWorkload.indices, id: \.self) { index in
                HStack {
                    Text(hourlyWorkload[index].emoji)
                        .font(.bold16)
                        .frame(width: 50)
                    
                    Text("\(hourlyWorkload[index].startTime) - \(hourlyWorkload[index].endTime)")
                        .font(.regular16)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                    
                    Text(hourlyWorkload[index].workload)
                        .font(.semibold16)
                        .fontWeight(.bold)
                        .foregroundColor(self.textColor(for: hourlyWorkload[index].workload))
                        .frame(width: 60)
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .font(.regular24)
                .foregroundColor(.primary)
                .padding(8)
                .background(Color.white.opacity(0.8))
                .clipShape(Circle())
        }
        .padding(.leading, 16)
        .padding(.top, 10)
        .accessibilityLabel("뒤로가기")
    }
    
    // Helper functions (unchanged)
    private func textColor(for workload: String) -> Color {
        switch workload {
        case "한산":
            return .green
        case "보통":
            return .yellow
        case "혼잡":
            return .red
        default:
            return .primary
        }
    }
    struct TimeBlock: Identifiable {
        let id = UUID()
        let startTime: String
        let endTime: String
        let workload: String
        let emoji: String
        let color: Color
    }
    
    private func startAngle(for index: Int) -> Angle {
        Angle(degrees: Double(index) * 360 / Double(hourlyWorkload.count) - 90)
    }
    
    private func endAngle(for index: Int) -> Angle {
        Angle(degrees: Double(index + 1) * 360 / Double(hourlyWorkload.count) - 90)
    }
    
    private func emojiOffset(for index: Int) -> CGSize {
        let angle = Double(index) * 360 / Double(hourlyWorkload.count) + 360 / Double(hourlyWorkload.count) / 2 - 90
        let radius: CGFloat = 100
        return CGSize(
            width: CGFloat(cos(angle * .pi / 180)) * radius,
            height: CGFloat(sin(angle * .pi / 180)) * radius
        )
    }
}
struct WorkloadArc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 1.8
        let innerRadius = radius * 0.5
        
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addArc(center: center, radius: innerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: true)
        path.closeSubpath()
        
        return path
    }
}

// TimeBlock and WorkloadArc structures remain unchanged

struct WorkplaceDifficultyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkplaceDifficultyDetailView(workplace: ("Starbucks", "스타벅스", "서초점"))
    }
}
