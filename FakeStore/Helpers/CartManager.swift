//
//  CartManager.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import Combine

class CartManager: ObservableObject {
	@Published var products: Products
	
	var count: Int {
		return products.count
	}
	
	init() {
		self.products = []
	}
	
	func add(_ product: Product) {
		products.append(product)
	}
	
	func remove(_ product: Product) {
		products.removeAll { $0.id == product.id }
	}
	
	func clear() {
		products.removeAll()
	}
	
}
