//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Eric Alves Brito on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsListingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarsListingTableViewController.instantiateFromStoryboard(.listing)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension CarsListingCoordinator: CarPresenter {
    func showCarWith(viewModel: CarVisualizationViewModel) {
        let childCoordinator = CarVisualizationCoordinator(navigationController: navigationController, carVisualizationViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
}

extension CarsListingCoordinator: CarCreator {
    func createCar(viewModel: CarFormViewModel = CarFormViewModel()) {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController, carFormViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
}
