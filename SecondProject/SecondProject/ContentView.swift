//
//  ContentView.swift
//  SecondProject
//
//  Created by BBPDEV on 20/10/23.
//

import SwiftUI
import WatchConnectivity

var watchSession: WCSession?

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.purple)
                .frame(width: 350, height: 450)
                .cornerRadius(10)
        
            VStack(){
                Image("man")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 200, alignment: .center)
                    .padding(20)
                
                Text("Bagus")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("iOS Dev")
                    .font(.title3)
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
