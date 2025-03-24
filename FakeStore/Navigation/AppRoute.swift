//
//  AppRoute.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import Foundation

enum AppRoute: Hashable {
	case home
	case productDetail(product: Product)
	case cart
}
