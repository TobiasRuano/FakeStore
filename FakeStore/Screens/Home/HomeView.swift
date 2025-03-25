//
//  HomeView.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import SwiftUI

struct HomeView: View {
	
	@EnvironmentObject var cartManager: CartManager
	@StateObject var viewModel: HomeViewModel
	@StateObject var coordinator = AppCoordinator()
	
	init(cartManager: CartManager, viewModel: HomeViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		NavigationStack(path: $coordinator.path) {
			ScrollView {
				if self.viewModel.displayStyle == .grid {
					let columns = [GridItem(.flexible()), GridItem(.flexible())]
					
					LazyVGrid(columns: columns) {
						ForEach(viewModel.products, id: \.id) { product in
							ProductCellVerticalView(product: product)
								.onTapGesture {
									coordinator.push(route: .productDetail(product: product))
								}
						}
					}
				} else {
					LazyVStack {
						ForEach(viewModel.products, id: \.id) { product in
							ProductCellView(product: product)
								.onTapGesture {
									coordinator.push(route: .productDetail(product: product))
								}
						}
					}
					.padding()
				}
			}
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button(action: {
						self.viewModel.updateDisplayStyle()
					}) {
						Image(systemName: "rectangle.portrait.rotate")
					}
				}
				ToolbarItem(placement: .topBarTrailing) {
					CartToolbarButtonView(cartCount: viewModel.getCartCount()) {
						coordinator.push(route: .cart)
					}
				}
			}
			.navigationTitle("Products")
			.navigationDestination(for: AppRoute.self) { route in
				coordinator.buildView(for: route, with: cartManager)
			}
		}
	}
}

#Preview {
	ViewFactory.makeHomeView(cartManager: CartManager())
		.environmentObject(CartManager())
}
