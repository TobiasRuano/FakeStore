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
		if !path.isEmpty {
			path.removeLast(path.count)
		}
	}
	
	func buildView(
		for route: AppRoute,
		with cart: CartManager
	) -> AnyView {
		switch route {
		case .home:
			AnyView(ViewFactory.makeHomeView(cartManager: cart).environmentObject(self))
		case .productDetail(let product):
			AnyView(ViewFactory.makeProductDetailView(product: product, cartManager: cart).environmentObject(self))
		case .cart:
			AnyView(ViewFactory.makeCartView(cartManager: cart))
		}
	}
}
