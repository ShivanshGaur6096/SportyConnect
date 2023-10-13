//
//  BottomSheet.swift
//  SportyConnect
//
//  Created by Shivansh Gaur on 05/10/23.
//
import SwiftUI

struct ProfileView: View {
    @Binding var isProfileViewPresented: Bool
    var profileSection: [String: Any]
    var generalOptionSection: [[String: String]]
    var advanceOptionSection: [[String: String]]

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                    List {
                        Section {
                            HStack(spacing: 40) {
                                Image(profileSection["accountPicture"] ?? "")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.green)
                                    .clipShape(
                                        Circle()
                                    )
                                Text(profileSection["accountName"] ?? "")
                            }
                            .padding(.vertical, 20) // Add vertical padding
                        }

                        Section("General Operation") {
                            ForEach(generalOptionSection, id: \.self) { option in
                                ListButtonViews(imageName: option["iconName"] ?? "", buttonTitle: option["buttonTitle"] ?? "")
                            }
                        }
                        .listRowSeparator(Visibility.hidden)

                        Section {
                            ForEach(advanceOptionSection, id: \.self) { option in
                                ListButtonViews(imageName: option["iconName"] ?? "", buttonTitle: option["buttonTitle"] ?? "")
                            }
                            .listRowSeparator(Visibility.hidden)
                        }
                    }
                    .listSectionSeparator(.visible)
                    .listSectionSeparatorTint(Color.gray)
                    .listSectionSeparatorTint(.blue)
                    .navigationBarItems(trailing: Button(action: {
                        isProfileViewPresented = false
                    }, label: {
                        Text("Done")
                            .foregroundColor(.blue)
                    }))
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {

    static var previews: some View {
        @State var isProfileViewPresented = false
        let dicttt = [
            "profileSection": ["accountName": "Dummy Data", "accountPicture": "light_background"],
            "generalOptionSection": [["iconName": "speaker.slash", "buttonTitle": "Mute"],
                                     ["iconName": "person.crop.circle", "buttonTitle": "Contact Info"],
                                     ["iconName": "message", "buttonTitle": "Clear Chat"]],
            "advanceOptionSection": [["iconName": "delete.right", "buttonTitle": "Block"],
                                     ["iconName": "minus.circle.fill", "buttonTitle": "Delete Chat"]]
        ]
        ProfileView(isProfileViewPresented: $isProfileViewPresented,
                    profileSection: [
                        "profileSection": ["accountName": "Dummy Data", "accountPicture": "light_background"],
                        "generalOptionSection": [["iconName": "speaker.slash", "buttonTitle": "Mute"],
                                                 ["iconName": "person.crop.circle", "buttonTitle": "Contact Info"],
                                                 ["iconName": "message", "buttonTitle": "Clear Chat"]],
                        "advanceOptionSection": [["iconName": "delete.right", "buttonTitle": "Block"],
                                                 ["iconName": "minus.circle.fill", "buttonTitle": "Delete Chat"]]
                    ],
        )
    }
}

struct ListButtonViews: View {
    let imageName: String
    let buttonTitle: String

    var body: some View {
        Button(action: {
            // Action
            print("\(buttonTitle) Button Pressed")
        }) {
            HStack(spacing: 10) {
                Image(systemName: imageName)
                Text(buttonTitle)
            }
        }
    }
}
