//
//  SelectArtistView.swift
//  Songs
//
//  Created by Killian Adonaï on 22/01/2022.
//

import SwiftUI

struct SelectArtistView: View {
	@ObservedObject private var viewModel = SelectArtistViewModel()
	
	var body: some View {
		NavigationView {
			List {
				if viewModel.artists.isEmpty {
					HStack {
						Spacer()
						Text("Please add a new artist")
						Spacer()
					}
				} else {
					ForEach(viewModel.artists) { artist in
						HStack {
							if let firstName = artist.firstName, let lastName = artist.lastName {
								Text(firstName + " " + lastName)
							}
						}
					}
					.onDelete { offsets in
						viewModel.deleteArtist(at: offsets)
					}
				}
			}
			.listStyle(.insetGrouped)
			.animation(.easeInOut, value: viewModel.artists)
			.navigationTitle("Artists")
			.navigationBarItems(
				trailing:
					Button {
						viewModel.showAddArtistView.toggle()
					} label: {
						Image(systemName: "plus")
					}
			).sheet(
				isPresented: $viewModel.showAddArtistView,
				onDismiss: {
					viewModel.fetchArtists()
				}) { AddArtistView() }
		}.onAppear {
			viewModel.fetchArtists()
		}
	}
	
	
	struct SelectArtistView_Previews: PreviewProvider {
		static var previews: some View {
			SelectArtistView()
		}
	}
}
