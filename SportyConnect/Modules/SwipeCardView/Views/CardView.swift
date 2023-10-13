//
//  CardView.swift
//  SportyConnect
//
//  Created by Shivansh Gaur on 27/09/23.
//

import SwiftUI

struct CardView: View {
    @State private var isProfileViewPresented = false
    @State var offset: CGSize = .zero

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Button("User Profile section") {
                        isProfileViewPresented = true
                    }
                    .sheet(isPresented: $isProfileViewPresented) {
                        ProfileView(isProfileViewPresented: $isProfileViewPresented,
                                    profileSection: ["accountName": "Dummy Data", "accountPicture": "light_background"],
                                    generalOptionSection: [
                                        ["iconName": "speaker.slash", "buttonTitle": "Mute"],
                                        ["iconName": "person.crop.circle", "buttonTitle": "Contact Info"],
                                        ["iconName": "message", "buttonTitle": "Clear Chat"]
                                    ],
                                    advanceOptionSection: [
                                        ["iconName": "delete.right", "buttonTitle": "Block"],
                                        ["iconName": "minus.circle.fill", "buttonTitle": "Delete Chat"]
                                    ])
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.clear)
                        .offset(offset)
                        .scaleEffect(getScaleAmount())
                        .rotationEffect(Angle(degrees: getRotationAmount()))
                        .frame(width: 300, height: 500)
                        .overlay(
                            // Added our Dating profile card view
                            CardContentView()
                                .padding()
                                .offset(offset)
                                .scaleEffect(getScaleAmount())
                                .rotationEffect(Angle(degrees: getRotationAmount()))
                        )
                        .background(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(red: 0.77, green: 0.32, blue: 0.09).opacity(0.49), location: 0.22),
                                    .init(color: Color(red: 0.51, green: 0.6, blue: 0.27).opacity(0.49), location: 0.42),
                                ]),
                                startPoint: UnitPoint(x: 0.54, y: 0.02),
                                endPoint: UnitPoint(x: 0.54, y: 1)
                            )
                            .cornerRadius(20)
                            .offset(offset)
                            .scaleEffect(getScaleAmount())
                            .rotationEffect(Angle(degrees: getRotationAmount()))
                        )
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    // On changing what to do
                                    withAnimation(.spring()) {
                                        offset = value.translation
                                    }
                                })
                                .onEnded({ value in
                                    // At the end, how it should look like
                                    withAnimation {
                                        offset = CGSize(width: 0, height: 0)
                                    }
                                })
                        )
                }
            }
        }
        .navigationTitle("DATE APP")
    }

    func getScaleAmount() -> CGFloat {
        let maxScreenWidth = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / maxScreenWidth
        return 1.0 - min(percentage, 0.5) * 0.5
    }

    func getRotationAmount() -> Double {
        let maxScreenWidth = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = Double(currentAmount / maxScreenWidth)
        let maxAngle: Double = 10.0
        return percentage * maxAngle
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
