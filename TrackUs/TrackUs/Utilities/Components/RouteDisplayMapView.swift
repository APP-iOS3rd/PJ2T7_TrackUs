//
//  RouteDisplayMapView.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/13.
//

import SwiftUI
import NMapsMap
/**
  트랙경로를 보여주는 맵뷰
  [NMGLatLng] 위도, 경도가 저장된 배열을 받아서 화면에 보여주는 맵뷰
 */
struct RouteDisplayMapView: UIViewRepresentable {
    let trackRoutePaths: [NMGLatLng]
    func makeCoordinator() -> Coordinator {
        Coordinator(trackRoutePaths: trackRoutePaths)
    }
    
    // NMFNaverMapView를 렌더링한다
    func makeUIView(context: Context) -> NMFNaverMapView {
        context.coordinator.view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
    }
    
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        
    }
    
    // 델리게이트들을 추가해주는 Coordinator 클래스 UIKit -> SwiftUI로의 데이터 전달
    class Coordinator: NSObject, ObservableObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate {
        let trackRoutePaths: [NMGLatLng]
        let view = NMFNaverMapView(frame: .zero)
        
        // MARK: - init
        init(trackRoutePaths: [NMGLatLng]) {
            self.trackRoutePaths = trackRoutePaths
            super.init()
            view.mapView.positionMode = .disabled
            view.mapView.mapType = .navi
            view.mapView.isNightModeEnabled = true
            
            view.mapView.zoomLevel = 14
            view.mapView.minZoomLevel = 10 // 최소 줌 레벨
            view.mapView.maxZoomLevel = 17 // 최대 줌 레벨
            
            view.showZoomControls = false // 줌 확대, 축소 버튼 활성화
            view.showCompass = false
            view.showScaleBar = false
            
            view.mapView.addCameraDelegate(delegate: self)
            view.mapView.touchDelegate = self
            
            renderTrackPath()
        }
        
        // 지점마다 포인트를 주기위해서 NMFPolylineOverlay 사용
        func renderTrackPath() {
            if trackRoutePaths.count < 2 {return}
            // 카메라의 포커스를 시작점의 위치로 설정합니다
            if let LatLng = findMinMaxLatLng(latLngArray: trackRoutePaths){
                let cameraUpdate = NMFCameraUpdate(scrollTo: LatLng.NMGLatLng,zoomTo: LatLng.zoom)
                view.mapView.moveCamera(cameraUpdate)
                view.mapView.extent = LatLng.NMGLatLngBounds
            }

            DispatchQueue.global(qos: .default).async {
                var markers = [NMFMarker]()
                for (idx, data) in self.trackRoutePaths.enumerated() {
                    var markerSize: CGFloat = 15
                    // 약간의 오차가 발생하여 왼쪽아래로 0.0002 이동
                    let marker = NMFMarker(position: NMGLatLng(lat: data.lat, lng: data.lng))
                    // userInfo 속성을 사용하여 터치 이벤트 리스너와 결합하여 사용
                    if idx == 0 {
                        marker.iconImage = NMFOverlayImage(name: "branch")
                    }
                    else if idx == self.trackRoutePaths.count - 1 {
                        marker.iconImage = NMFOverlayImage(name: "branchFinish")
                        markerSize = 25
                    } else {
                        marker.iconImage = NMFOverlayImage(name: "branch")
                    }
                    marker.width = markerSize
                    marker.height = markerSize
                    markers.append(marker)
                }
                
                // 지도에 추가하는 작업은 메인스레드에서 수행
                DispatchQueue.main.async { [weak self] in
                    for marker in markers {
                        marker.mapView = self?.view.mapView
                    }
                }
            }
            
            let polyline = NMFPolylineOverlay(trackRoutePaths)
            polyline?.width = 5
            polyline?.color = UIColor.sub
            polyline?.mapView = view.mapView
            
        }
        
        func findMinMaxLatLng(latLngArray: [NMGLatLng]) -> (NMGLatLng: NMGLatLng, NMGLatLngBounds: NMGLatLngBounds, zoom: Double)? {
            guard let firstPoint = latLngArray.first else {
                    return nil
                }
                
                var minLat = firstPoint.lat
                var maxLat = firstPoint.lat
                var minLng = firstPoint.lng
                var maxLng = firstPoint.lng
                
                for point in latLngArray {
                    minLat = min(minLat, point.lat)
                    maxLat = max(maxLat, point.lat)
                    minLng = min(minLng, point.lng)
                    maxLng = max(maxLng, point.lng)
                }
            let latLng = NMGLatLng(lat: (minLat+maxLat)/2, lng: (minLng+maxLng)/2)
            let southWest = NMGLatLng(lat: minLat, lng: minLng)
            let northEast = NMGLatLng(lat: maxLat, lng: maxLng)
            let bounds = NMGLatLngBounds(southWest: southWest, northEast: northEast)
            
            
            let coordinate = maxLat - minLat * 12 / 10 > (maxLng - minLng) ? maxLat - minLat * 12 / 10 : (maxLng - minLng)
            var meter = 0.0015
            var zoom:Double = 17
            var zoomlever = 1
            while coordinate>meter {
                meter *= 2
                zoom -= 1
            }
                
                    
                    
            return (latLng, bounds, zoom)
        }
        // MARK: - methods
        // 맵을 클릭하면 위도, 경도를 찍어준다.
//        func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
//            
//        }
    }
    
}
