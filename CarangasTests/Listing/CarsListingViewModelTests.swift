//
//  CarsListingViewModelTests.swift
//  CarangasTests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {

    //System Under Test
    var sut: CarsListingViewModel!
    
    override func setUp() {
        super.setUp()
        sut = CarsListingViewModel(service: CarAPIStub())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCount(){
        //Given
        
        
        //When
        sut.loadCars()
        
        //Then
        let expectResult = 8
        XCTAssertEqual(sut.count, expectResult, "Total de carros diferente do esperado")
        
    }
    
    func testFirstCarInfo() {
        //Given
        let indexPath = IndexPath(row: 0, section: 0)
        
        //When
        sut.loadCars()
        let carVisualizationModel = sut.getCarVisualizationViewModelFor(indexPath)
        
        //Then
        XCTAssertEqual(carVisualizationModel.title, "M3", "Nome do carro errado")
        XCTAssertEqual(carVisualizationModel.brand, "Marca: Acura", "Marca do carro errado")
    }

}
