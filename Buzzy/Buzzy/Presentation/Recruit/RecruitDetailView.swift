//
//  RecruitDetailView.swift
//  Buzzy
//
//  Created by Juno Lee on 9/24/24.
//

import SwiftUI


struct RecruitDetailView: View {
    var recruit: Recruit
    @State private var isApplied: Bool = false
    
    init(recruit: Recruit) {
        self.recruit = recruit
        loadAppliedStatus()
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ScrollView {
                
                Image(recruit.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                DescriptionView(recruit: recruit)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isApplied.toggle()
                        saveAppliedStatus()
                    }) {
                        Text(isApplied ? "신청됨" : "신청하기")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal, 8)
                            .background(isApplied ? Color.orange : Color.blue)
                            .cornerRadius(10.0)
                    }
                    .padding(.bottom, 20)
                    .padding(.trailing, 16)
                }
            }
        }
        .onAppear {
            loadAppliedStatus()
        }
    }
    
    private func loadAppliedStatus() {
        let key = "applied_\(recruit.id.uuidString)"
        isApplied = UserDefaults.standard.bool(forKey: key)
    }
    
    private func saveAppliedStatus() {
        let key = "applied_\(recruit.id.uuidString)"
        UserDefaults.standard.set(isApplied, forKey: key)
    }
}

struct DescriptionView: View {
    var recruit: Recruit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recruit.title)
                .font(.title)
                .fontWeight(.bold)
            
            
            HStack(spacing: 4) {
                
            }
            Spacer()
        }
        
        Text("직무")
            .fontWeight(.medium)
            .padding(.vertical, 8)
        Text(recruit.jobDescription)
            .lineSpacing(8.0)
            .opacity(0.6)
        
        
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("시급")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Text(recruit.hourlyWage)
                    .opacity(0.6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("위치")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Text(recruit.location)
                    .opacity(0.6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
        }
        .padding(.vertical)
        
        
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("일하는 기간")
                    .fontWeight(.semibold)
                Text(recruit.workPeriod)
                    .opacity(0.6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("근무 시간")
                    .fontWeight(.semibold)
                Text(recruit.workHours)
                    .opacity(0.6)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            
            
        }
        .padding(.vertical)
        
        
    }
    
}


struct RecruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitDetailView(recruit: recruits[0])
    }
}
