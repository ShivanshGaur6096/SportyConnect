//
//  CardContentView.swift
//  SportyConnect
//
//  Created by Shivansh Gaur on 27/09/23.
//

import SwiftUI


struct CardContentView: View {

    var body: some View {
        VStack {
            Text("Say Hello,\n To Your Dating App!")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)

            Image("light_background")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)

            HStack(spacing: 30) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 40))

                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 40))
            }
            .padding()

            Spacer()

            HStack {
                HStack {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(Color.green)
                    Text("Tinder")
                        .font(.callout)
                        .fontWeight(.heavy)
                }

                Spacer()

                HStack {
                    Text("Hinge")
                        .font(.callout)
                        .fontWeight(.heavy)
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .foregroundColor(Color.green)
                }
            }
        }
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardContentView()
            .frame(width: 300, height: 500)
    }
}
