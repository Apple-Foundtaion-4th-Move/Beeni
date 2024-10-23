//
//  ContentView.swift
//  Move
//
//  Created by 이혜빈 on 10/18/24.
//


import SwiftUI
import MapKit
import CoreLocation

//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    var locationManager = CLLocationManager()
//    
//    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.01, longitude: 129.32), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)) // 초기 값
//    
//    override init() {
//        super.init()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization() // 위치 권한 요청
//        locationManager.startUpdatingLocation() // 위치 업데이트 시작
//        //        self.locationManager.requestWhenInUseAuthorization() // 위치 정보 가져오기
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
//        guard let location = location.last else { return }
//        
//        // 사용자의 현재 위치를 기반으로 지도의 중심 업데이트
//        //        Region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        }
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Failed to find user's location: \(error.localizedDescription)")
//    }
//    
//}



struct ContentView: View {
    @State private var isActive = false // 기본 값 false로 둬서 스플래시 실행 후 나오게
    
    var body: some View {
        if isActive {
            TabView(selection: .constant(0)) { // 하단 Tab bar
                
                // 프로필 페이지 탭
                ProfileView()
                    .tabItem {Label("Profile", systemImage: "house.fill")}
                    .tag(0)
                
                // 모임 페이지 탭
                RunView()
                    .tabItem {Label("Run", systemImage: "figure.run")}
                    .tag(1)
                
                // 채팅 페이지 탭
                ChatView()
                    .tabItem {Label("Chat", systemImage: "message.fill")}
                    .tag(2)
                
            }
        } else {
            SplashView(isActive: $isActive)
        }
    }
    
}



#Preview {
    ContentView()
}



