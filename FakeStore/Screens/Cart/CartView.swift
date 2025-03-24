//
//  CartView.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import SwiftUI

struct CartView: View {
	
	@EnvironmentObject var cartManager: CartManager
	
    var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(cartManager.products, id: \.id) { product in
					ProductCellView(product: product)
				}
			}
			.padding()
		}
		.navigationTitle("Cart")
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					cartManager.clear()
				} label: {
					Image(systemName: "trash")
				}

			}
		}
    }
}

#Preview {
    CartView()
		.environmentObject(CartManager())
}
