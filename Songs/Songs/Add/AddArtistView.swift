//
//  AddArtistView.swift
//  Songs
//
//  Created by Killian Adonaï on 22/01/2022.
//

import SwiftUI

struct AddArtistView: View {
	@ObservedObject private var viewModel = AddArtistViewModel()
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("First Name", text: $viewModel.firstName)
					TextField("Last Name", text: $viewModel.lastName)
					
					
				}
				Button {
					viewModel.addArtist()
				} label: {
					HStack {
						Spacer()
						Text("Add Artist")
						Spacer()
					}
				}
			}
			.navigationTitle("Add Artist")
			.navigationBarTitleDisplayMode(.inline)
			.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
				Button ("OK", role: .cancel) {
					presentationMode.wrappedValue.dismiss()
				}} message: {
					Text(viewModel.alertMessage)
				}
		}
	}
	
	struct AddArtistView_Previews: PreviewProvider {
		static var previews: some View {
			AddArtistView()
		}
	}
}

