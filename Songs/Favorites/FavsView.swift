//
//  FavsView.swift
//  Songs
//
//  Created by Killian Adonaï on 19/01/2022.
//

import SwiftUI

struct FavsView: View {
	@ObservedObject private var viewModel = FavsViewModel()
	var body: some View {
		NavigationView {
			List {
				if viewModel.songs.isEmpty {
					HStack {
						Spacer()
						Text("Please add a new favorite song")
						Spacer()
					}
				} else {
					ForEach(viewModel.songs) { song in
						HStack {
							if let title = song.title {
								Text(title)
							}
							Spacer()
							Text(song.artist?.firstName ?? "No Artist")
						}
					}
					.onDelete { offsets in
						viewModel.deleteSongs(at: offsets)
					}
				}
			}
			.listStyle(.insetGrouped)
			.animation(.easeInOut, value: viewModel.songs)
			.navigationTitle("Songs")
			.navigationBarItems(
				trailing:
					Button {
						viewModel.showAddSongView.toggle()
					} label: {
						Image(systemName: "plus")
					}
			).sheet(
				isPresented: $viewModel.showAddSongView,
				onDismiss: {
					viewModel.fetchSongs()
				}) { AddSongView() }
		}.onAppear {
			viewModel.fetchSongs()
		}
	}
	
	struct FavsView_Previews: PreviewProvider {
		static var previews: some View {
			FavsView()
		}
	}
}

