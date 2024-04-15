//
//  ReuseWebView.swift
//  webview progressbar
//
//  Created by Edo Lorenza on 15/04/24.
//

import SwiftUI

public struct ReuseWebView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isLoading: Bool = false
    @State private var progress: Double = 0.0
    
    public init(title: String, urlWeb: String) {
        self.title = title
        self.urlWeb = urlWeb
    }
    let title: String
    let urlWeb: String
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0){
                
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16, alignment: .leading)
                    })
                    .frame(width: 40, height: 40, alignment: .leading)
                    Spacer()
                    Text(title)
                        .font(.headline)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .background(Color.white)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.vertical, 8)
                .background(Color.white)
                
                ZStack{
                    Divider()
                    if self.isLoading {
                        ProgressView(value: progress, total: 1.0)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(.blue)
                            .scaleEffect(x: 1, y: 0.5, anchor: .trailing)
                    }
                }
                .frame(height: 4)
            }
            WebView(urlToDisplay: self.urlWeb, isLoading: self.$isLoading, progress: self.$progress)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}
