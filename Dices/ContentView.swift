//
//  ContentView.swift
//  Dices
//
//  Created by Vladimir on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var numOfDices = 2
    @State private var sides = 0
    @State private var result: [Int] = [0, 0]
    @State private var degrees: Double = 0
    
    let layout = [
        GridItem(.adaptive(minimum: 100, maximum: 100))
    ]
    
    var body: some View {
        
        VStack {
        
        VStack(alignment: .leading) {
            
                    Stepper(value: $numOfDices, in: 1...9, step: 1) { _ in
                        generate()
                    } label: {
                        Text("Number of dices: \(numOfDices)")
                    }
                    
                    Picker(selection: $sides, label: Text("Number of sides: \(sides + 4)")) {
                        ForEach(4..<101) { index in
                            Text("\(index)")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                
                Button {
                    withAnimation {
                        degrees += 360
                    }
                    generate()
                    save()
                } label: {
                    Text("Spin!")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 3, y: 4)
                .padding()

            }
        
        
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(0 ..< numOfDices, id: \.self) { index in
                    DiceView(number: result[index])
                        .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 0, z: 0))
                        
                }
              }
            }
        Spacer ()
        }
    }
    
    func generate() {
        print(numOfDices)
        result.removeAll()
        for _ in 1...numOfDices {
            result.append(Int.random(in: 1...(sides + 4)))
        }
        print(result)
    }
    
    func save() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
