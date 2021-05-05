//
//  ContentView.swift
//  StenSaksPapir
//
//  Created by Esben Viskum on 05/04/2021.
//

import SwiftUI

struct ContentView: View {
    let spilMuligheder = ["Papir", "Saks", "Sten"]
    
    @State private var computerValg = Int.random(in: 0..<3)
    @State private var win = Bool.random()
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text("Din score \(score)")
            Text("Computer valg: \(spilMuligheder[computerValg])")
                .font(.title)
            Text(win ? "Du skal vinde" : "Du skal tabe")
            
            ForEach(0..<3) { number in
                Button(action: {
                        self.brugerValg(number)
                }) {
                    Text(spilMuligheder[number])
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }

    func brugerValg(_ number: Int) {
        if computerValg+1 == number || (computerValg == 2 && number == 0) {
            if win {score += 1} else {score -= 1}
        }
        if computerValg == number+1 || (computerValg == 0 && number == 2) {
            if win {score -= 1} else {score += 1}
        }
        computerValg = Int.random(in: 0..<3)
        win = Bool.random()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
