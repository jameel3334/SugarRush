//
//  MealsUnitTest.swift
//  SugarRushTests
//
//  Created by Mohammed Jameeluddin on 9/10/23.
//

import XCTest
@testable import SugarRush

final class MealsUnitTest: XCTestCase {

    func testDecodeSuccess() {
        XCTAssertNoThrow(try JSONMapper.decode(file: "meal_valid_response", type: Meals.self), "Mapper shouldn't throw an error")
        let decodedModel = try? JSONMapper.decode(file: "meal_valid_response", type: Meals.self)
        
        XCTAssertEqual(decodedModel?.meals.first?.id, "52893")
        XCTAssertEqual(decodedModel?.meals.first?.ingredientsAndMeasures.first, "Plain Flour - 120g")
        XCTAssertEqual(decodedModel?.meals.first?.ingredientsAndMeasures.count, 9)
    }
}
