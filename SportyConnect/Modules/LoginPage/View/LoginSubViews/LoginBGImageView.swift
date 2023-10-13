//
//  LoginBGImageView.swift
//  SportyConnect
//
//  Created by Shivansh Gaur on 27/09/23.
//

import SwiftUI

struct LoginBGImageView: View {

    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(.red)
            .frame(width: 300, height: 300)

            Text("FREE DATE APP")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct LoginBGImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginBGImageView()
    }
}
