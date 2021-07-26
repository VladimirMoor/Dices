//
//  ContentView.swift
//  Dices
//
//  Created by Vladimir on 23.07.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var numOfDices = 2
    @State private var sides = 0
    @State private var result: [Int] = [0, 0]
    @State private var degrees: Double = 0
    @Environment(\.managedObjectContext) var moc
    
    let layout = [
        GridItem(.adaptive(minimum: 100, maximum: 100))
    ]
    
    var body: some View {
        TabView {
        VStack {
        
        VStack(alignment: .leading) {
            
                    Stepper(value: $numOfDices, in: 1...9, step: 1) { _ in
                        generate()
                    } label: {
                        Text("Number of dices: \(numOfDices)")
                    }
                    .padding(.top, 50)
                    
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
                    save(context: moc)
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
        .tabItem {
            Image(systemName: "house")
            Text("Roll dices")
        }
            
         ResultsView()
            .tabItem {
                Image(systemName: "list.dash")
                Text("Results")
            }
            
        }
        
    }
    
    func generate() {
        
        result.removeAll()
        for _ in 1...numOfDices {
            result.append(Int.random(in: 1...(sides + 4)))
        }
        
        print(numOfDices)
        print(result)
    }
    
    func save(context: NSManagedObjectContext) {
        
        let entityResult = Result(context: context)
        entityResult.date = Date()
        entityResult.id = UUID()
        
        for dice in result {
            let entityDice = Dice(context: context)
            entityDice.number = Int16(dice)
            entityResult.addToDice(entityDice)
        }
        
        try? context.save()
        print("saved! Result ID = \(entityResult.id?.uuidString ?? "no data")")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
