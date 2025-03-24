//
//  AppAssembler.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import Foundation

struct AppAssembler {
	static func makeHomeView(cartManager: CartManager) -> HomeView {
		let networkManager = NetworkManager()
		let dataSource = NetworkAPI(networkManager: networkManager)
		let repo = FakeStoreRepositoryImp(dataSource: dataSource)
		let useCase = GetProductUseCase(repo: repo)
		let homeView = HomeView(
			cartManager: cartManager,
			viewModel: HomeViewModel(
				cartManager: cartManager,
				useCase: useCase
			)
		)
		return homeView
	}
	
	static func makeProductDetailView(product: Product, cartManager: CartManager) -> ProductDetailView {
		let viewModel = ProductDetailViewModel(product: product, cartManager: cartManager)
		let view = ProductDetailView(viewModel: viewModel)
		
		return view
	}
}
