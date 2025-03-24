//
//  AppCoordinator.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import SwiftUI

protocol Coordinator: ObservableObject {
	func push(route: AppRoute)
	func pop()
	func popToRoot()
	func buildView(for route: AppRoute, with cart: CartManager) -> any View
}

class AppCoordinator: Coordinator {
	@Published var path: NavigationPath = NavigationPath()
	
	func push(route: AppRoute) {
		path.append(route)
	}
	
	func pop() {
		path.removeLast()
	}
	
	func popToRoot() {
		path.removeLast(path.count - 1)
	}
	
	func buildView(for route: AppRoute, with cart: CartManager) -> any View {
		switch route {
		case .home:
			AppAssembler.makeHomeView(cartManager: cart)
		case .productDetail(let product):
			AppAssembler.makeProductDetailView(product: product, cartManager: cart)
		case .cart:
			AppAssembler.makeCartView(cartManager: cart)
		}
	}
}
