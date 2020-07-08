//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by RichK on 4/16/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var condition = true
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userScore = 0
    @State private var roundNumber = 0
    @State private var showingScore = false
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Your score: \(userScore)")
                Text("Round \(roundNumber)/10")
            }
            
            VStack {
                Text("Computer chose")
                    .foregroundColor(.black)
                Text(moves[correctAnswer])
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            
            VStack {
                Text("You need to")
                    .foregroundColor(.black)
                Text("test")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            
            VStack(spacing: 30) {
                ForEach(0..<3) { number in
                    Button(action: {
                        self.answerTapped(number)
                        self.askQuestion()
                        self.roundUp()
                    }) {
                        Text (self.moves[number])
                    }
                }
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text("Game set!"), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
        }
    }
    
    
    func answerTapped(_ number: Int) {
        if number == correctAnswer {
            userScore += 1
        } else {
            userScore -= 1
        }
        
    }
    
    func askQuestion() {
        correctAnswer = Int.random(in: 0...2)
    }
    
    func roundUp() {
        if roundNumber < 10 {
            roundNumber += 1
        } else {
            showingScore = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
