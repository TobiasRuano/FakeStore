//
//  FakeStoreRepositoryImp.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

struct FakeStoreRepositoryImp: FakeStoreRepository {
	
	let dataSource: NetworkDataSource
	
	func getData<T>(path: String) async throws -> T where T : Decodable {
		return try await dataSource.getData(path: path)
	}
}
