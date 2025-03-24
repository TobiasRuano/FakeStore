//
//  NetworkManager.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

enum RequestType: String {
	case get
}

class NetworkManager {
	func fetchData<T: Decodable>(
		requestType: RequestType,
		urlString: String
	) async throws -> T {
		let request = self.buildRequest(urlString: urlString,
										requestType: requestType)
		let (data, response) = try await URLSession.shared.data(for: request)
		
		print(response)
		return try JSONDecoder().decode(T.self, from: data)
	}
	
	private func buildRequest(
		urlString: String,
		requestType: RequestType
	) -> URLRequest {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "fakestoreapi.com"
		components.path = urlString
		
		var request = URLRequest(url: components.url!)
		request.httpMethod = requestType.rawValue
		
		return request
	}
}
