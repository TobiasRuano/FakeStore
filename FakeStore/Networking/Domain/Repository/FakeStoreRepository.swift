//
//  FakeStoreRepository.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

enum FakeStoreEndpoint: String {
	case products = "/products"
}

protocol FakeStoreRepository {
	
	func getData<T: Decodable>(path: String) async throws -> T
}
