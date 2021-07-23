//
//  ContentView.swift
//  Dices
//
//  Created by Vladimir on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 0...6)
    @State private var rotDegrees: Double = 0
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    
                Text("\(number)")
            }
            .rotation3DEffect(
                .degrees(rotDegrees),
                axis: (x: 1.0, y: 0.0, z: 0.0))
            
            Button(action: {
                withAnimation {
                number = Int.random(in: 0...6)
                rotDegrees += 360
                }
            })
            {
                Text("Spin!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
