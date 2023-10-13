//
//  LogInView.swift
//  SportyConnect
//
//  Created by Shivansh Gaur on 27/09/23.
//

import SwiftUI

struct LogInView: View {
    @State var startingOffSetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    @State var isCreateAccountButtonTapped: Bool = false // Track button tap state

    var body: some View {
        NavigationView {
            ZStack {
                LoginBGImageView()
                
                SignInContentView()
                    .offset(y: startingOffSetY)
                    .offset(y: currentDragOffsetY)
                    .offset(y: endingOffsetY)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                currentDragOffsetY = value.translation.height
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    if currentDragOffsetY < -150 {
                                        endingOffsetY = -(UIScreen.main.bounds.height / 3)
                                    } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                        endingOffsetY = 0
                                    }
                                    currentDragOffsetY = 0
                                }
                            }
                    )
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct LogInSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
