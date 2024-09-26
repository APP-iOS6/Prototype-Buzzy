//
//  LocationSettingsView.swift
//  Buzzy
//
//  Created by Min on 9/25/24.
//

//
//  LocationSettingsView.swift
//  Buzzy
//
//  Created by Min on 9/25/24.
//

import SwiftUI
import MapKit
import CoreLocation

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(latitude: 37.57097782567055, longitude: 126.97883784814778)
}

struct LocationSettingsView: View {
    @State private var searchText: String = ""
    @State private var selectedText: String? // 핀 클릭 시 보여줄 텍스트
    @StateObject private var locationManager = LocationManager() // 위치 관리자 추가

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
            
            MapView(selectedText: $selectedText, userLocation: locationManager.location) // MapView 사용
                .frame(width: .infinity, height: 500)
                .cornerRadius(15)
            
            if let selectedText = selectedText { // 선택된 텍스트가 있을 경우에만 표시
                Text(selectedText)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.top, 8)
            }
            
            Spacer()
            
            Button {
                if let userLocation = locationManager.location {
                    // 사용자 위치로 맵의 중심을 설정
                    MapView(selectedText: $selectedText, userLocation: userLocation).centerMap(at: userLocation)
                } else {
                    print("현재 위치를 찾을 수 없습니다.")
                }
            } label: {
                Text("지역 설정")
                    .font(.semibold20)
                    .foregroundStyle(.white)
            }
            .frame(width: 340, height: 50)
            .background(.accent)
            .cornerRadius(10)
            
            Spacer()
        }
        .navigationTitle("지역 설정")
        .onAppear {
            locationManager.requestLocation() // 위치 요청
        }
    }
}


struct MapView: UIViewRepresentable {
    @Binding var selectedText: String? // 선택된 텍스트 바인딩
    var userLocation: CLLocationCoordinate2D? // 사용자 위치

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        // Add parking annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = .parking
        mapView.addAnnotation(annotation)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // 사용자 위치 업데이트
        if let userLocation = userLocation {
            uiView.setCenter(userLocation, animated: true)

            // 사용자 위치에 대한 애노테이션 추가
            let userAnnotation = MKPointAnnotation()
            userAnnotation.coordinate = userLocation
            userAnnotation.title = "현재 위치"
            uiView.addAnnotation(userAnnotation)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            // 클릭한 애노테이션의 제목이 "현재 위치"일 경우 텍스트 업데이트
            if let title = view.annotation?.title, title == "현재 위치" {
                parent.selectedText = "당신의 현재 위치입니다!" // 원하는 텍스트로 변경
            } else {
                parent.selectedText = "멋쟁이사자처럼" // 기본 텍스트
            }
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            // 핀 클릭 해제 시 텍스트 초기화
            parent.selectedText = nil
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // 현재 위치에 대한 애노테이션 뷰 설정
            if annotation.title == "현재 위치" {
                let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "userLocation")
                
                // 원 형태로 설정
                let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 24, height: 24))
                
                // buzzySky 색상 (내부)
                let blueColor = UIColor(named: "buzzySky")
                print("buzzySky color: \(String(describing: blueColor))") // nil인지 확인
                
                let blueLayer = CAShapeLayer()
                blueLayer.path = circlePath.cgPath
                blueLayer.fillColor = blueColor?.cgColor ?? UIColor.blue.cgColor // 기본값 설정
                
                // 흰색 테두리 (외부)
                let borderLayer = CAShapeLayer()
                borderLayer.path = circlePath.cgPath
                borderLayer.fillColor = UIColor.clear.cgColor
                borderLayer.strokeColor = UIColor.white.cgColor
                borderLayer.lineWidth = 2 // 테두리 두께
                
                // 레이어 추가
                annotationView.layer.addSublayer(blueLayer) // 파란색 레이어 먼저 추가
                annotationView.layer.addSublayer(borderLayer) // 흰색 테두리 그 위에 추가
                annotationView.bounds = CGRect(x: 0, y: 0, width: 24, height: 24)
                annotationView.canShowCallout = true
                return annotationView
            }
            return nil
        }
    }

    func centerMap(at location: CLLocationCoordinate2D) {
        // 주어진 위치로 맵의 중심을 설정
        if let mapView = self as? MKMapView {
            mapView.setCenter(location, animated: true)
        }
    }
}


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location.coordinate
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error obtaining location: \(error.localizedDescription)")
    }
}

#Preview {
    LocationSettingsView()
}
