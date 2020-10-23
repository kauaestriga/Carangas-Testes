//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Eric Alves Brito on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarVisualizationCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var carVisualizationViewModel: CarVisualizationViewModel
    
    init(navigationController: UINavigationController, carVisualizationViewModel: CarVisualizationViewModel) {
        self.navigationController = navigationController
        self.carVisualizationViewModel = carVisualizationViewModel
    }
    
    func start() {
        let viewController = CarVisualizationViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = carVisualizationViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func editCar(viewModel: CarFormViewModel) {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController, carFormViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.startModally()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let child = child {
            remove(childCoordinator: child)
        } else {
            parentCoordinator?.childDidFinish(self)
        }
    }
    
    deinit {
        print("CarVisualizationCoordinator -> deinit")
    }
}
