//
//  MapViewModel.swift
//  TrackUs
//
//  Created by 윤준성 on 12/11/23.
//

import SwiftUI
import UIKit
import NMapsMap

struct MapViewModel: UIViewRepresentable {

    func makeCoordinator() -> Coordinator {
        Coordinator.shared
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        context.coordinator.getNaverMapView()
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
    
}
    
final class Coordinator: NSObject, ObservableObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate {
    
    static let shared = Coordinator()
    
    let view = NMFNaverMapView()

    @Published var coord: (Double, Double) = (0.0, 0.0)
    @Published var userLocation: (Double, Double) = (0.0, 0.0)
    @ObservedObject var trackViewModel = TrackViewModel()
    
    var locationManager: CLLocationManager?
    
    // Coordinator 클래스 안의 코드
    
    override init() {
        super.init()
        renderMarker()
        view.mapView.positionMode = .direction
        view.mapView.isNightModeEnabled = true
        
        view.mapView.zoomLevel = 15
        view.mapView.minZoomLevel = 5 // 최소 줌 레벨
        view.mapView.maxZoomLevel = 17 // 최대 줌 레벨
        
        view.showLocationButton = true
        view.showZoomControls = false // 줌 확대, 축소 버튼 활성화
        view.showCompass = true
        view.showScaleBar = false
        
        view.mapView.addCameraDelegate(delegate: self)
        view.mapView.touchDelegate = self
        view.mapView.mapType = .navi
    }
    
    // Coordinator 클래스 안의 코드
    func mapView(_ mapView: NMFMapView, cameraWillChangeByReason reason: Int, animated: Bool) {
        // 카메라 이동이 시작되기 전 호출되는 함수
    }
    
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        // 카메라의 위치가 변경되면 호출되는 함수
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("위치 정보 접근이 제한되었습니다.")
        case .denied:
            print("위치 정보 접근을 거절했습니다. 설정에 가서 변경하세요.")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Success")
            
            coord = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
            userLocation = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
            
            fetchUserLocation()
            
        @unknown default:
            break
        }
    }
    
    func checkIfLocationServiceIsEnabled() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                DispatchQueue.main.async {
                    self.locationManager = CLLocationManager()
                    self.locationManager!.delegate = self
                    self.checkLocationAuthorization()
                }
            } else {
                print("Show an alert letting them know this is off and to go turn i on")
            }
        }
    }
    
    func fetchUserLocation() {
        if let locationManager = locationManager {
            let lat = locationManager.location?.coordinate.latitude
            let lng = locationManager.location?.coordinate.longitude
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0), zoomTo: 15)
            cameraUpdate.animation = .easeIn
            cameraUpdate.animationDuration = 1
            
            let locationOverlay = view.mapView.locationOverlay
            locationOverlay.location = NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0)
            locationOverlay.hidden = false
            
            locationOverlay.icon = NMFOverlayImage(name: "location_overlay_icon")
            locationOverlay.iconWidth = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
            locationOverlay.iconHeight = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
            locationOverlay.anchor = CGPoint(x: 0.5, y: 1)
            
            view.mapView.moveCamera(cameraUpdate)
        }
    }
    
    func getNaverMapView() -> NMFNaverMapView {
        view
    }
    
    func renderMarker() {
        DispatchQueue.global(qos: .default).async {
            var markers = [NMFMarker]()
            for track in self.trackViewModel.trackDatas {
                let marker = NMFMarker(position: NMGLatLng(lat: track.trackPaths.points[0].lat, lng: track.trackPaths.points[0].lng))
                // userInfo 속성을 사용하여 터치 이벤트 리스너와 결합하여 사용
                marker.userInfo = [
                    "제목": track.trackName
                ]
                marker.iconImage = NMFOverlayImage(name: "marker3")
                marker.width = CGFloat(NMF_MARKER_SIZE_AUTO)
                marker.height = CGFloat(NMF_MARKER_SIZE_AUTO)
                markers.append(marker)
            }
            DispatchQueue.main.async { [weak self] in
                for marker in markers {
                    marker.mapView = self?.view.mapView
                    marker.touchHandler = { (overlay) -> Bool in
                        if let marker = overlay as? NMFMarker,
                           let title = marker.userInfo["제목"] as? String {
                            print("마커 터치됨: \(title)")

                            if let track = self?.trackViewModel.trackDatas.first(where: { $0.trackName == title }) {
                                self?.navigateToMateDetailView(track: track)
                            }
                        }
                        return true
                    }
                }
            }
        }
    }

    func navigateToMateDetailView(track: TrackInfo) {
        let mateDetailView = MateDetailView(trackInfo: track)
        DispatchQueue.main.async {
            let navController = UINavigationController(rootViewController: UIHostingController(rootView: mateDetailView))
            UIApplication.shared.windows.first?.rootViewController?.present(navController, animated: true, completion: nil)
        }
    }
}
