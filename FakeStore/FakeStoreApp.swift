//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import SwiftUI

@main
struct FakeStoreApp: App {
	
	@StateObject var cartManager = CartManager()
	
    var body: some Scene {
        WindowGroup {
			AppAssembler.makeHomeView(cartManager: cartManager)
				.environmentObject(cartManager)
        }
    }
}
