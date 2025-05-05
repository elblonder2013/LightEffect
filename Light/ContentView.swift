//
//  ContentView.swift
//  Light
//
//  Created by Alexei on 3/5/25.
//

import SwiftUI


struct RotatingLightScene: View {
    @State private var angle: Double = 90
    var body: some View {
        ZStack {
            LightAnimatedText(angleDeg: angle)
        }
        .ignoresSafeArea()
        .onAppear {
            animateSequence()
        }
    }
    
    func animateSequence() {
        Task {
            while true {
                let sequence: [Double] = [-360, -230, -290, -250, -280, -268]
                for (index, target) in sequence.enumerated() {
                    let duration = 0.5 - Double(index) * 0.05
                    withAnimation(.easeInOut(duration: duration)) {
                        angle = target
                    }
                    try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
                }
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 0.5)) {
                    angle = -270
                }
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                
                angle = 90
            }
        }
    }
}

// MARK: - Preview
struct ContentView: View {
    var body: some View {
        RotatingLightScene()
    }
}

#Preview {
    ContentView()
}

