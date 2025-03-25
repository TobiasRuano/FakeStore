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
					ZStack(alignment: .topTrailing) {
						Button(action: {
							coordinator.push(route: .cart)
						}) {
							Image(systemName: "cart")
								.font(.title2)
						}
						
						if cartManager.count > 0 {
							Text("\(viewModel.getCartCount())")
								.font(.caption)
								.foregroundColor(.white)
								.padding(6)
								.background(Color.blue)
								.clipShape(Circle())
								.offset(x: 8, y: -8)
						}
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
