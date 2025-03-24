//
//  CartManagerTests.swift
//  FakeStoreTests
//
//  Created by Tobias Ruano on 24/03/2025.
//

import XCTest
@testable import FakeStore

final class CartManagerTests: XCTestCase {
	
	var cartManager: CartManager!

    override func setUpWithError() throws {
		cartManager = CartManager()
    }

    override func tearDownWithError() throws {
		cartManager = nil
    }
	
	func testAddToCart() {
		let product = Product(id: 1,
							  title: "Title",
							  price: 9.99,
							  description: "Some description",
							  category: "food", image: "",
							  rating: Rating(rate: 10.0, count: 100))
		
		cartManager.add(product)
		
		XCTAssertEqual(cartManager.count, 1)
	}
	
	func testRemoveFromCart() {
		let product = Product(id: 1,
							  title: "Title",
							  price: 9.99,
							  description: "Some description",
							  category: "food", image: "",
							  rating: Rating(rate: 10.0, count: 100))
		
		cartManager.add(product)
		
		XCTAssertEqual(cartManager.count, 1)
		
		cartManager.remove(product)
		XCTAssertEqual(cartManager.count, 0)
	}
	
	func testRemoveAllFromCart() {
		let product = Product(id: 1,
							  title: "Title",
							  price: 9.99,
							  description: "Some description",
							  category: "food", image: "",
							  rating: Rating(rate: 10.0, count: 100))
		let product2 = Product(id: 2,
							  title: "Title2",
							  price: 7.99,
							  description: "Some description2",
							  category: "food", image: "",
							  rating: Rating(rate: 9.99, count: 70))
		
		cartManager.add(product)
		cartManager.add(product2)
		
		XCTAssertEqual(cartManager.count, 2)
		
		cartManager.clear()
		XCTAssertEqual(cartManager.count, 0)
	}

}
