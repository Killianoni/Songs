//
//  RatingView.swift
//  Songs
//
//  Created by Killian Adonaï on 19/01/2022.
//

import SwiftUI

struct RatingView: View {
	var title: String?
	@Binding var rating: Int
	
	private let maximumRating = 5
	private let offColor = Color.gray
	private let onColor = Color.yellow

	var body: some View {
		HStack {
			if let title = title {
				Text(title)
				Spacer()
			}

			ForEach(1..<maximumRating + 1, id: \.self) { number in
				Image(systemName: "star.fill")
					.foregroundColor(number > rating ? offColor : onColor)
					.onTapGesture {
						rating = number
					}
			}
		}
	}
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
