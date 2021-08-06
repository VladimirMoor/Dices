//
//  ResultsView.swift
//  Dices
//
//  Created by Vladimir on 26.07.2021.
//

import SwiftUI
import CoreData

struct ResultsView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Result.entity(), sortDescriptors: []) var results: FetchedResults<Result>

    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(results) { result in
                    VStack(alignment: .leading) {
                        Text("Date: \(getDate(date: result.date))")
                        Text("Total: " + getTotal(array: result.dicesArray))
                        
                        HStack {
                            
                            if let arr = result.dice?.allObjects as? [Dice] {
                                ForEach(arr) { num in
                                    Text("\(num.number)")
                                        .padding(8)
                                        .background(Color.gray)
                                        .cornerRadius(5)
                                    
                                }
                            }
                            
                            
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.init(red: 0.2, green: 0.4, blue: 0.1, opacity: 0.2))
                    .padding(10)
                    .cornerRadius(4)
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        
    }
    
    
    func getTotal(array: [Dice]) -> String {
        var total = 0
        for item in array {
            total += Int(item.number)
        }
        return "\(total)"
    }
    
    func getDate(date: Date?) -> String {
        var strDate = "no date"
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        
        if let date = date {
            strDate = formatter.string(from: date)
        }
        
        return strDate
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
