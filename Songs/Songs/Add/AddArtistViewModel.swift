//
//  AddArtistViewModel.swift
//  Songs
//
//  Created by Killian Adonaï on 22/01/2022.
//

import SwiftUI

class AddArtistViewModel: ObservableObject {
	@Published var firstName: String = ""
	@Published var lastName: String = ""
	@Published var date = Date()
	@Published var showAlert = false
	var alertMessage: String = ""
	var alertTitle: String = ""
	
	func addArtist() {
		let artistResult = DBManager.shared.addArtist(firstName: firstName, lastName: lastName, coverURL: URL(string: "https://api.lorem.space/image/album?w=150&h=150"))
		
		switch artistResult {
		case .success(let artist):
			handlerError(title: "Well done", message: "Successfully added \(artist.firstName ?? "artist") \(artist.lastName ?? "artist")")
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

