//
//  BaseCoordinator.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 19.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol BaseCoordinatorDelegate: class {
    func coordinatorRootViewControllerDidDeinit(coordinator: BaseCoordinator)
}

protocol BaseCoordinator: BaseCoordinatorDelegate {
    var childCoordinators: [BaseCoordinator] { get set }
    var baseDelegate: BaseCoordinatorDelegate? { get set }
    
    var topController: UIViewController { get }
    var topCoordinator: BaseCoordinator? { get }
    
    func start()
}

extension BaseCoordinator {
    var topCoordinator: BaseCoordinator? {
        return childCoordinators.first
    }
}

extension BaseCoordinator {
    func remove(child coordinator: BaseCoordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func dismissModalControllers(_ completion: (() -> Void)?) {
        if let presentingViewController = topController.presentingViewController {
            presentingViewController.dismiss(animated: true, completion: { [unowned self] in
                self.dismissModalControllers(completion)
            })
        } else {
            completion?()
        }
    }
    
    func addChildCoordinator(_ coordinator: BaseCoordinator) {
        childCoordinators.append(coordinator)
        coordinator.baseDelegate = self
    }
    
    func coordinatorRootViewControllerDidDeinit(coordinator: BaseCoordinator) {
        remove(child: coordinator)
    }
}
