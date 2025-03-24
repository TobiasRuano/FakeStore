//
//  GetProductsUseCase.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

protocol GetProducts {
	func getProducts() async throws -> Products
}

struct GetProductUseCase: GetProducts {
	let repo: FakeStoreRepository
	
	func getProducts() async throws -> Products {
		let path: FakeStoreEndpoint = .products
		
		do {
			let response: Products = try await repo.getData(path: path.rawValue)
			print(response)
			return response
		} catch {
			print(error.localizedDescription)
			throw error
		}
	}
}
