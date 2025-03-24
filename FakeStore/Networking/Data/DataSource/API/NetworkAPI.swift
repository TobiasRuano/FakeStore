//
//  NetworkAPI.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

struct NetworkAPI: NetworkDataSource {
	
	let networkManager: NetworkManager
	
	func getData<T>(path: String) async throws -> T where T : Decodable {
		return try await networkManager.fetchData(requestType: .get, urlString: path)
	}
}
