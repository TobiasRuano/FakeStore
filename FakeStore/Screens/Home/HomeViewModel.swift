//
//  HomeViewModel.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import SwiftUI

enum DisplayStyle {
	case list
	case grid
}

class HomeViewModel: ObservableObject {
	
	var cartManager: CartManager
	@Published var products: Products = []
	@Published var displayStyle: DisplayStyle = .list
	let useCase: GetProductUseCase
	
	init(cartManager: CartManager, useCase: GetProductUseCase) {
		self.cartManager = cartManager
		self.useCase = useCase
		getProducts()
	}
	
	private func getProducts() {
		Task {
			do {
				let productsResponse = try await useCase.getProducts()
				await MainActor.run {
					self.products = productsResponse
				}
			} catch {
				print(error.localizedDescription)
			}
		}
	}
	
	func updateDisplayStyle() {
		let style: DisplayStyle = self.displayStyle == .list ? .grid : .list
		withAnimation {
			self.displayStyle = style
		}
	}
	
	func getCartCount() -> Int {
		return cartManager.count
	}
}
