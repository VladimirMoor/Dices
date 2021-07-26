//
//  DiceView.swift
//  Dices
//
//  Created by Vladimir on 24.07.2021.
//

import SwiftUI

struct DiceView: View {
    
    var number: Int
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 100)
                    .cornerRadius(10)
                    
                Text("\(number)")
            }
        }
 }
}
