//
//  ContentView.swift
//  FirstProjectWatch Watch App
//
//  Created by BBPDEV on 20/10/23.
//

import SwiftUI
import WatchConnectivity
import Combine


struct ContentView: View {
    
    @ObservedObject var watchSession = WatchSession()
    @State private var textValue = "Empty"

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(textValue)
                .onReceive(
                    Just(watchSession.receivedData).delay(for: 1, scheduler: RunLoop.main)
                ){
                    newValue in
                    self.textValue = watchSession.receivedData
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
