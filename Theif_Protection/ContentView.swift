//
//  ContentView.swift
//  Theif_Protection
//
//  Created by poomipat Makornwattana on 15/5/2568 BE.
//

import SwiftUI
struct ContentView: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        VStack {
            Text("Counter: \(counter)")
            Button("เพิ่ม") {
                counter += 1
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
