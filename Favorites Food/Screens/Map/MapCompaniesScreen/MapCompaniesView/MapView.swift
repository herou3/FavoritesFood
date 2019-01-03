//
//  MapView.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import SnapKit
import MapKit

class MapView: MKMapView {
    
    // MARK: - Init world map view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UI elements
    private let mapTrackingButton: UIButton = {
        let trackImage = #imageLiteral(resourceName: "locate-icon")
        let trackingButton = UIButton(type: UIButtonType.custom)
        trackingButton.frame = CGRect(origin: CGPoint(x: Constant.offsetValue,
                                                      y: Constant.offsetValue * 2),
                                      size: CGSize(width: 40,
                                                   height: 40))
        trackingButton.setImage(trackImage,
                                for: .normal)
        trackingButton.backgroundColor = .clear
        return trackingButton
    }()
    
    // MARK: - configure mapView
    private func addMapView() {
        let region = MKCoordinateRegion(center: Constant.coordinatesOfParis,
                                        span: MKCoordinateSpan(latitudeDelta: Constant.latitudeDeltaValue * 2,
                                                               longitudeDelta: Constant.longitudeDeltaValue * 2))
        self.setRegion(region, animated: true)
        self.addSubview(mapTrackingButton)
    }
    
    private func setupView() {
        addMapView()
    }
}
