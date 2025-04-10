//
//  ProductDetailViewModel.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import Combine

class ProductDetailViewModel: ObservableObject {
	
	let cartManager: CartManager
	let product: Product
	
	init(
		product: Product,
		cartManager: CartManager
	) {
		self.product = product
		self.cartManager = cartManager
	}
	
	func isProductOnCart() -> Bool {
		cartManager.products.contains(product)
	}
	
	func addToCart() {
		cartManager.add(product)
	}
	
	func removeFromCart() {
		cartManager.remove(product)
	}
}
