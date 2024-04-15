//
//  ContentView.swift
//  webview progressbar
//
//  Created by Edo Lorenza on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                NavigationLink(destination: ReuseWebView(title: "Creating a Carousel in SwiftUI", urlWeb: "https://edolorenza.medium.com/creating-a-carousel-in-swiftui-619121268949")) {
                    Text("Creating a Carousel in SwiftUI")
                }
                
                NavigationLink(destination: ReuseWebView(title: "Lottie Animation in SwiftUI: A Quick Guide", urlWeb: "https://edolorenza.medium.com/lottie-animation-in-swiftui-a-quick-guide-04fbb4095008")) {
                    Text("Lottie Animation in SwiftUI: A Quick Guide")
                }
                
                NavigationLink(destination: ReuseWebView(title: "Floating draggable GIF SwiftUI: A Quick Guide", urlWeb: "https://edolorenza.medium.com/floating-draggable-gif-swiftui-a-quick-guide-dc2dfbb6a8ec")) {
                    Text("Floating draggable GIF SwiftUI: A Quick Guide")
                }
            }
        }
    }
}
