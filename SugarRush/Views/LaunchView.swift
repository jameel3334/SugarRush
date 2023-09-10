//
//  LaunchView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/9/23.
//

import SwiftUI

struct LaunchView: View {
    @State private var launchScreenIsShowing = true
    @State private var bounceLogo            = false
    @State private var size                  = 0.5
    @State private var opacity               = 0.5
    private let timer                        = Timer.publish(every: 0.75,
                                                             on: .main,
                                                             in: .common).autoconnect()
    var body: some View {
        if launchScreenIsShowing {
            ZStack {
                LinearGradient(colors: [.orange, Color(Constants.Color.accentColor).opacity(Constants.General.opacityBackground)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                        SugarView(image: UIImage(named:Constants.Image.sugarImage) ?? UIImage (), bounceLogo: bounceLogo, opacity: opacity)
    
                    
                    .scaleEffect(bounceLogo ? 0.8 : 1.0)
                    .onReceive(timer) { input in
                        withAnimation(.spring()) {
                            bounceLogo.toggle()
                        }
                    }
                    Text(Constants.String.appName)
                        .cornerRadius(12)
                        .scaleEffect(size)
                        .opacity(opacity)
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 2)) {
                        self.size = 1.5
                        self.opacity = 1.0
                    }
                    Task {
                        try await Task.sleep(nanoseconds: UInt64(3.2e+9))
                        withAnimation {
                            self.launchScreenIsShowing = false
                        }
                    }
                }
            }
        } else {
            TabViews()
        }
    }
}


struct SugarView: View {
    let image: UIImage
    let bounceLogo: Bool
    let opacity: Double
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .opacity(opacity)
            .scaleEffect(bounceLogo ? 0.8 : 1.0)
            .rotationEffect(.degrees(bounceLogo ? 360 : 0))
    }
}
