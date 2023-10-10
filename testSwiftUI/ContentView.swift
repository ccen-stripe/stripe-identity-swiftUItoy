//
//  ContentView.swift
//  testSwiftUI
//
//  Created by Chen Cen on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Button("startIdentity") {
                viewModel.present()
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
