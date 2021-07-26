//
//  ResultsView.swift
//  Dices
//
//  Created by Vladimir on 26.07.2021.
//

import SwiftUI

struct ResultsView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Result.entity(), sortDescriptors: []) var results: FetchedResults<Result>
    
    var body: some View {
        
        ScrollView {
            VStack {
            ForEach(results) { result in
                VStack {
                    Text("Date: \(getDate(date: result.date))")
                    Text("Total: " + getTotal(array: result.dicesArray))
                    HStack {
                    ForEach(result.dicesArray) { num in
                        Text("\(num.number)")
                            .padding(10)
                            .background(Color.gray)
                            .cornerRadius(3)
                            
                    }
                    }
            }
            .background(Color.yellow)
            
            }
        }
            .frame(minWidth: .infinity, alignment: .leading)
            .background(Color.red)
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
