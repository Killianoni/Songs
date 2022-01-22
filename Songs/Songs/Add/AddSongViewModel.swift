//
//  AddSongViewModel.swift
//  Songs
//
//  Created by Killian Adonaï on 19/01/2022.
//

import SwiftUI

class AddSongViewModel: ObservableObject {
	@Published var songTitle: String = ""
	@Published var date = Date()
	@Published var rate = 4
	@Published var isFavorite = false
	@Published var showAlert = false
	var alertMessage: String = ""
	var alertTitle: String = ""
	
	func addSong() {
		let songResult = DBManager.shared.addSong(title: songTitle, rate: Int64(rate), releaseDate: date, isFavorite: isFavorite, lyrics: "lol", coverURL: URL(string: "https://api.lorem.space/image/album?w=150&h=150"))
		
		switch songResult {
		case .success(let song):
			handlerError(title: "Well done", message: "Successfully added \(song.title ?? "song")")
		case .failure(let error):
			handlerError(title: "⚠️ WARNING ⚠️", message: error.localizedDescription)
		}
	}
	private func handlerError(title: String, message: String) {
		alertTitle = title
		alertMessage = message
		showAlert.toggle()
	}
}
