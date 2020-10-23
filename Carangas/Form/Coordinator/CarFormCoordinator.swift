//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Eric Alves Brito on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarFormCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let carFormViewModel: CarFormViewModel
    
    init(navigationController: UINavigationController, carFormViewModel: CarFormViewModel = CarFormViewModel()) {
        self.navigationController = navigationController
        self.carFormViewModel = carFormViewModel
    }
    
    func startModally() {
        let viewController = CarFormViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = carFormViewModel
        viewController.coordinator = self
        navigationController.present(viewController, animated: true, completion: nil)
    }
    
    func start() {
        let viewController = CarFormViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = carFormViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("CarFormCoordinator -> deinit")
    }
}
