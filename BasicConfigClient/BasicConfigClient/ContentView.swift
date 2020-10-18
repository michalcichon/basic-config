//
//  ContentView.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 11/10/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ContentViewModel()
    var body: some View {
        ZStack {
            Color(model.backgroundColor).ignoresSafeArea()
            Link(model.buttonText, destination: model.buttonURL)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
