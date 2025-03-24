//
//  NetworkDataSource.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

protocol NetworkDataSource {
	func getData<T: Decodable>(path: String) async throws -> T
}
