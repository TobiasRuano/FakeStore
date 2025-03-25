//
//  CartToolbarButtonView.swift
//  FakeStore
//
//  Created by Tobias Ruano on 24/03/2025.
//

import SwiftUI

struct CartToolbarButtonView: View {
	let cartCount: Int
	let onTap: () -> Void
	
    var body: some View {
		ZStack(alignment: .topTrailing) {
			Button(action: onTap) {
				Image(systemName: "cart")
					.font(.title2)
			}
			
			if cartCount > 0 {
				Text("\(cartCount)")
					.font(.caption)
					.foregroundStyle(.white)
					.padding(6)
					.background(.blue)
					.clipShape(Circle())
					.offset(x: 9, y: -8)
			}
		}
    }
}

#Preview {
	CartToolbarButtonView(cartCount: 1, onTap: {})
}
