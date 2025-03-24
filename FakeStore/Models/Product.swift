//
//  Product.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import Foundation

typealias Products = [Product]

struct Product: Codable, Hashable {
	let id: Int
	let title: String
	let price: Double
	let description: String
	let category: String
	let image: String
	let rating: Rating
	
	var formattedPrice: String {
		return self.price.formatted(.currency(code: "ARS"))
	}
}

struct Rating: Codable, Hashable {
	let rate: Double
	let count: Int
}
