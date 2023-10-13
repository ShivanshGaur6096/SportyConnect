//
//  SwipeUpSignInView.swift
//  SportyConnect
//
//  Created by Shivansh Gaur on 27/09/23.
//

import SwiftUI

struct SignInContentView: View {
    @State var isCreateAccountButtonTapped: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)

            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Text("This is a heavily animated application with a lot of surprises coming soon. \nStay Tuned ")
                .multilineTextAlignment(.center)

            NavigationLink(destination: CardView(), isActive: $isCreateAccountButtonTapped) {
                Button {
                    // Action
                    isCreateAccountButtonTapped = true // Activate the NavigationLink
                } label: {
                    Text("NO ACCOUNTS CREATION \nJust Swipe")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.black.cornerRadius(10))
                }
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.gray)
        .cornerRadius(30)
    }
}

struct SwipeUpSignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInContentView()
    }
}
