//
//  CompaniesMapController.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import MapKit
import SnapKit

class MapCompaniesController: UIViewController {
    
    // MARK: - Properties
    private let mapView = MapView()
    private let descriptionCompanyView = CompanyOfMapView()
    private let mapCompaniesViewModel: MapCompaniesViewModel?
    private let tableView: UITableView = UITableView()
    private var locationManager: CLLocationManager = CLLocationManager()
    private var geocoder: CLGeocoder = CLGeocoder()
    private var pointAnotations: [MKPointAnnotation] = []
    private var hasAuthorizationStatus: Bool = false
    private var placemarks: [CLPlacemark] = []
    private var hasFoundLocality: Bool = false
    
    // MARK: - Init / Deinit
    init(viewModel: MapCompaniesViewModel) {
        self.mapCompaniesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Configure MapCompaniesController
    private func addMapView() {
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.view)
        }
        mapView.isUserInteractionEnabled = true
    }
    
    private func addTableView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view).offset(self.view.bounds.width / 2)
            make.right.bottom.equalTo(self.view)
        }
        tableView.isHidden = true
    }
    
    private func addDescriptionCompanyView() {
        self.view.addSubview(descriptionCompanyView)
        descriptionCompanyView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(self.view.bounds.height / 2)
            make.left.equalTo(self.view).offset(Constant.offsetValue)
            make.right.equalTo(self.view).offset(-Constant.offsetValue)
            make.bottom.equalTo(self.view).offset(-Constant.offsetValue)
        }
        descriptionCompanyView.isHidden = true
    }
    
    private func configureViewController() {
        addMapView()
        addTableView()
        addDescriptionCompanyView()
    }
}
