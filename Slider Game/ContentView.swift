//
//  ContentView.swift
//  Slider Game
//
//  Created by Кирилл on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Передвиньте слайдер как можно ближе к \(targetValue)")
            HStack {
                Text("0")
                SwiftUISlider(value: $currentValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert("Поздравляем! Ваш счет \(computeScore()).",
                   isPresented: $alertPresented,
                   actions: {})
            .padding()
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
