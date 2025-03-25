//
//  ProductDetailView.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import SwiftUI

struct ProductDetailView: View {
	
	@EnvironmentObject var coordinator: AppCoordinator
	@ObservedObject private var viewModel: ProductDetailViewModel
	
	init(viewModel: ProductDetailViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		ScrollView {
			VStack {
				AsyncImage(url: URL(string: viewModel.product.image)!) { image in
					image
						.resizable()
						.aspectRatio(1, contentMode: .fill)
				} placeholder: {
					ProgressView()
				}
				.padding(.bottom, 16)
				
				VStack {
					Text(viewModel.product.title)
						.font(.title).bold()
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.top, 16)
					
					Text("Price")
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.headline)
						.padding(.top, 20)
					Text(viewModel.product.formattedPrice)
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.title3)
					
					Text("Description")
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.headline)
						.padding(.top, 20)
					
					Text(viewModel.product.description)
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.subheadline)
						.padding(.bottom, 20)
				}
				.padding([.leading, .trailing], 16)
				.background(
					RoundedRectangle(cornerRadius: 10)
						.foregroundStyle(.white)
					.shadow(radius: 10)
				)
				.padding([.leading, .trailing], 16)
				
				Button {
					if viewModel.isProductOnCart() {
						self.viewModel.removeFromCart()
					} else {
						self.viewModel.addToCart()
					}
				} label: {
					if viewModel.isProductOnCart() {
						Label("Remove from Cart", systemImage: "cart")
							.foregroundStyle(.white)
							.frame(maxWidth: .infinity)
							.padding()
							.background(RoundedRectangle(cornerRadius: 10).fill(.red))
					} else {
						Label("Add to Cart", systemImage: "cart.fill")
							.foregroundStyle(.white)
							.frame(maxWidth: .infinity)
							.padding()
							.background(RoundedRectangle(cornerRadius: 10))
					}
				}
				.padding()
			}
		}
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				CartToolbarButtonView(cartCount: viewModel.cartManager.count) {
					coordinator.push(route: .cart)
				}
			}
		}
    }
}

#Preview {
    ProductDetailView(
		viewModel: ProductDetailViewModel(
			product: Product(
				id: 1,
				title: "Some title",
				price: 99.99,
				description: "Some short description",
				category: "Food",
				image: "https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg",
				rating: Rating(
					rate: 9.0,
					count: 100
				)
			),
			cartManager: CartManager()
		)
	)
	.environmentObject(CartManager())
	.environmentObject(AppCoordinator())
}
