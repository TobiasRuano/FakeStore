//
//  ProductCellView.swift
//  FakeStore
//
//  Created by Tobias Ruano on 22/03/2025.
//

import SwiftUI

struct ProductCellView: View {
	let product: Product
	
    var body: some View {
		HStack {
			AsyncImage(url: URL(string: product.image)!) { image in
				image
					.resizable()
					.frame(width: 50, height: 50)
			} placeholder: {
				ProgressView()
					.frame(width: 50, height: 50)
			}
			
			VStack(alignment: .leading) {
				Text(product.title)
					.font(.title3)
					.lineLimit(1)
				Text(product.description)
					.font(.footnote)
					.lineLimit(2)
			}
			
			VStack {
				Text(product.formattedPrice)
					.font(.title2)
			}
		}
		.padding([.top, .bottom], 10)
    }
}

#Preview {
	ProductCellView(
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
		)
	)
}
