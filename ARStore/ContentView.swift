//
//  ContentView.swift
//  ARStore
//
//  Created by Smit Patel on 08/08/24.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        
        ZStack{
            
            HomeView()
                .preferredColorScheme(.light)
        }
        
    }
}

#Preview {
    ContentView()
}
