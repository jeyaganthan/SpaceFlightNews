//
//  Spaceflight_NewsApp.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import SwiftUI

@main
struct Spaceflight_NewsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}


struct SplashScreen: View {
    @State private var animationFinished = false
    @State private var scale: CGFloat = 1

    // Define the gradient colors
    let gradientColors: [Color] = [Color.blue, Color.purple]

    var body: some View {
        ZStack {
            // Main content of your app (shown after the splash animation)
            VStack {
                if animationFinished {
                    NewsCategoryView()
                }
            }
            .zIndex(0)

            // Animated Splash View
            if !animationFinished {
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom) // This line creates the gradient
                    .ignoresSafeArea()
                    .overlay(
                        Image(systemName: "newspaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .scaleEffect(scale)
                            .opacity(Double(2 - scale))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.5)) {
                                    scale = 2
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation {
                                        animationFinished = true
                                    }
                                }
                            }
                    )
                    .zIndex(1)
            }
        }
    }
}
