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
	
	@State var path = NavigationPath()
	
	init(cartManager: CartManager, viewModel: HomeViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		NavigationStack(path: $path) {
			ScrollView {
				if self.viewModel.displayStyle == .grid {
					let columns = [GridItem(.flexible()), GridItem(.flexible())]
					
					LazyVGrid(columns: columns) {
						ForEach(viewModel.products, id: \.id) { product in
							ProductCellVerticalView(product: product)
								.onTapGesture {
									self.path.append(product)
								}
						}
					}
				} else {
					LazyVStack {
						ForEach(viewModel.products, id: \.id) { product in
							ProductCellView(product: product)
								.onTapGesture {
									self.path.append(product)
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
							self.path.append(cartManager.products)
						}) {
							Image(systemName: "cart")
								.font(.title2)
						}
						
						if true { // reemplazá por la lógica real
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
			.navigationDestination(for: Product.self) { product in
				AppAssembler.makeProductDetailView(product: product, cartManager: cartManager)
			}
			.navigationDestination(for: Products.self) { _ in
				CartView()
					.environmentObject(cartManager)
			}
		}
	}
}

#Preview {
	AppAssembler.makeHomeView(cartManager: CartManager())
		.environmentObject(CartManager())
}
