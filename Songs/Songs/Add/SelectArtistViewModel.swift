//
//  SelectArtistViewModel.swift
//  Songs
//
//  Created by Killian Adonaï on 22/01/2022.
//

import SwiftUI

class SelectArtistViewModel: ObservableObject {
	@Published var showAddArtistView = false
	
	@Published var artists = [Artist]()
	init() {
		fetchArtists()
	}
	
	func fetchArtists() {
		let artistsResult = DBManager.shared.getAllArtists()
		switch artistsResult {
		case .failure: return ()
		case .success(let artists): self.artists = artists
		}
	}
	
	func deleteArtist(at offsets: IndexSet) {
		offsets.forEach { index in
			DBManager.shared.deleteSong(by: artists[index].objectID)
		}
		artists.remove(atOffsets: offsets)
	}
}

