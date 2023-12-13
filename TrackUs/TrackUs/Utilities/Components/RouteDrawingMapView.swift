//
//  TrackPathUIMapView.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import SwiftUI
import NMapsMap
/**
 트랙경로를 보여주고 데이터를 저장하는 맵뷰
 */
// UIViewRepresentable을 이용하여 UIKit 뷰를 SwiftUI와 브릿징
struct RouteDrawingMapView: UIViewRepresentable {
    @EnvironmentObject var trackViewModel: TrackViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(trackViewModel: trackViewModel)
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        context.coordinator.view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
    }
    
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        
    }
    
    // 델리게이트들을 추가해주는 Coordinator 클래스 UIKit -> SwiftUI로의 데이터 전달
    class Coordinator: NSObject, ObservableObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate {
        
        let view = NMFNaverMapView(frame: .zero)
        @ObservedObject var trackViewModel: TrackViewModel
        // MARK: - init
        init(trackViewModel: TrackViewModel) {
            
            self.trackViewModel = trackViewModel
            super.init()
            
            view.mapView.positionMode = .direction
            view.mapView.mapType = .navi
            view.mapView.isNightModeEnabled = true
            
            view.mapView.zoomLevel = 15
            view.mapView.minZoomLevel = 10 // 최소 줌 레벨
            view.mapView.maxZoomLevel = 17 // 최대 줌 레벨
            
            view.showZoomControls = true // 줌 확대, 축소 버튼 활성화
            view.showCompass = false
            view.showScaleBar = false
            
            view.mapView.addCameraDelegate(delegate: self)
            view.mapView.touchDelegate = self
            
            renderTrackPath()
        }
        
        func renderTrackPath() {
            if trackViewModel.currnetTrackData.trackPaths.points.count >= 2 {
                trackViewModel.currnetTrackData.trackPaths.width = 10
                trackViewModel.currnetTrackData.trackPaths.color = UIColor.sub
                trackViewModel.currnetTrackData.trackPaths.mapView = view.mapView
            }
        }
        
        // MARK: - methods
        // 맵을 클릭하면 위도, 경도를 찍어준다.
        func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
            trackViewModel.currnetTrackData.trackPaths.width = 10
            trackViewModel.currnetTrackData.trackPaths.color = UIColor.sub
            trackViewModel.currnetTrackData.trackPaths.points.append(latlng)
            trackViewModel.currnetTrackData.trackPaths.mapView = view.mapView
            trackViewModel.caculateWorkoutMetrics()
            print(1)
            var marker: NMFMarker
            var markerSize: CGFloat = 20
            if trackViewModel.currnetTrackData.trackPaths.points.count == 1 {
                marker = NMFMarker(position: NMGLatLng(lat: trackViewModel.currnetTrackData.trackPaths.points[0].lat, lng: trackViewModel.currnetTrackData.trackPaths.points[0].lng))
                
                marker.iconImage = NMFOverlayImage(name: "branch")
                marker.width = markerSize
                marker.height = markerSize
                marker.mapView = view.mapView
            } else {
                
            }
            
            
        }
    }
    
}

