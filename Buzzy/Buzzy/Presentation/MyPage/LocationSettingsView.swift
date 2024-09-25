//
//  LocationSettingsView.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(latitude: 36.815129, longitude: 127.1138939)
}

struct LocationSettingsView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("지역을 입력하세요", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }
            .padding()
            
            Map {
                Annotation("Parking", coordinate: .parking) {
                    VStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                            .padding(5)
                        Image(systemName: "mappin")
                            .resizable()
                            .frame(width: 15, height: 35)
                            .padding(5)
                    }
                }
                .annotationTitles(.hidden)
            }
            .mapStyle(.standard(elevation: .realistic))
            .frame(width: .infinity, height: 500)
            .cornerRadius(15)
            
            
            Spacer()
            
            Button {
                print("지역 설정")
            } label: {
                Text("지역 설정")
                    .font(.semibold20)
            }
            .frame(width: 340, height: 50)
            .background(.yellow)
            .cornerRadius(10)
            
            Spacer()
        }
        .navigationTitle("지역 설정")
    }
}

#Preview {
     LocationSettingsView()
}
