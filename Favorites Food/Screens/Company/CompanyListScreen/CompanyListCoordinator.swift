//
//  CompanyListCoordinator.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateableWitchContactList: class {
    var company: Company? { get set }
    var food: Food? { get set }
}

final class CompanyListCoordinator {
    
    // MARK: - Properties
    private weak var navigationController: UINavigationController?
    private var navigFoodController: UINavigationController?
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        self.navigationController = navigationController
        self.navigationController?.navigationBar.barTintColor = .moderatePink
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        showContactList()
    }
    
    // MARK: - Private implementation
    private func showContactList() {
        
        let companiesListViewModel = CompanyListViewModel()
        let foodsListViewModel = FoodListViewModel()
        foodsListViewModel.delegate = self
        let mapViewModel = MapCompaniesViewModel()
        
        let companiesController = CompanyListController(viewModel: companiesListViewModel)
        let foodController = FoodListViewController(viewModel: foodsListViewModel)
        let mapController = MapCompaniesController(viewModel: mapViewModel)
        
        let navCompaniesController = UINavigationController(rootViewController: companiesController)
        let navFoodController = UINavigationController(rootViewController: foodController)
        let navMapController = UINavigationController(rootViewController: mapController)
        
        navCompaniesController.configureNavigationBar(navigationController: navCompaniesController)
        navMapController.configureNavigationBar(navigationController: navMapController)
        navFoodController.configureNavigationBar(navigationController: navFoodController)
        
        navigFoodController = navFoodController
        
        companiesController.title = "Companies"
        companiesController.tabBarItem.image = #imageLiteral(resourceName: "company-icon")
        foodController.title = "Foods"
        foodController.tabBarItem.image = #imageLiteral(resourceName: "food-icon")
        mapController.title = "Map"
        mapController.tabBarItem.image = #imageLiteral(resourceName: "map-icon")
        
        let tabBarList = [navCompaniesController, navFoodController, navMapController]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = tabBarList
        tabBarController.tabBar.tintColor = .red
        tabBarController.navigationItem.title = "Hello"
        tabBarController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationController?.pushViewController(tabBarController, animated: false)
    }
    
    private func showFoodDetail(_ food: Food) {
        let viewModel = FoodDetailViewModel(food: food)
        let detailController = FoodDetailController(viewModel: viewModel)
        detailController.navigationItem.title = viewModel.title
        navigFoodController?.pushViewController(detailController, animated: true)
    }
}

extension CompanyListCoordinator: FoodListViewModelDelegate {
    
    func foodListViewModel(_ viewModel: FoodListViewModel, didSelectFood food: Food) {
        showFoodDetail(food)
    }
}
