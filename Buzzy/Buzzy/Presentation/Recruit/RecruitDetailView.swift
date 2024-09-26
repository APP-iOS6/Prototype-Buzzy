//
//  RecruitDetailView.swift
//  Buzzy
//
//  Created by Juno Lee on 9/24/24.
//

import SwiftUI
import MapKit

struct RecruitDetailView: View {
    var recruit: Recruit
    @State private var isApplied: Bool = false
    @State private var region: MKCoordinateRegion
    
    init(recruit: Recruit) {
        self.recruit = recruit
        self._region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: recruit.latitude, longitude: recruit.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
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
                
                // 지도 추가
                VStack(alignment: .leading) {
                    Text("위치")
                        .font(.bold16)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                    Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: [recruit]) { recruit in
                        MapMarker(coordinate: CLLocationCoordinate2D(latitude: recruit.latitude, longitude: recruit.longitude), tint: .blue)
                    }
                    .frame(height: 300)
                    .cornerRadius(10)
                }
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
                            .background(isApplied ? Color.buzzyPink : Color.orange)
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
                .font(.bold24)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading) {
                Text("직무")
                    .font(.bold16)
                    .fontWeight(.semibold)
                    .padding(.top, 2)
                
                Text(recruit.jobDescription)
                    .lineSpacing(8.0)
                    .opacity(0.6)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 0)
            
          
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("시급")
                        .font(.bold16)
                        .fontWeight(.semibold)
                    Text(recruit.hourlyWage)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("근무 시간")
                        .font(.bold16)
                        .fontWeight(.semibold)
                    Text(recruit.workHours)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 40)
            }
            .padding(.vertical)

           
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("일하는 기간")
                        .font(.bold16)
                        .fontWeight(.semibold)
                    Text(recruit.workPeriod)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("지역")
                        .font(.bold16)
                        .fontWeight(.semibold)
                    Text(recruit.location)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 40)
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}






struct RecruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitDetailView(recruit: recruits[1])
    }
}
