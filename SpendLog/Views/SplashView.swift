//
//  SplashView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 0.6
    @State private var logoOpacity = 0.0

    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack {
                Color.backgroundBeige.ignoresSafeArea()

                VStack(spacing: 24) {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                        .onAppear {
                            withAnimation(.easeOut(duration: 1.2)) {
                                logoScale = 1.0
                                logoOpacity = 1.0
                            }
                        }

                    Text("Track mindfully. Spend wisely.")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    BouncingDots()
                        .padding(.top, 8)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct BouncingDots: View {
    @State private var bounce = false

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { i in
                Circle()
                    .fill(Color.accentOrangeRed)
                    .frame(width: 10, height: 10)
                    .offset(y: bounce ? -6 : 6)
                    .animation(
                        Animation.easeInOut(duration: 0.4)
                            .repeatForever()
                            .delay(Double(i) * 0.15),
                        value: bounce
                    )
            }
        }
        .onAppear { bounce = true }
    }
}
