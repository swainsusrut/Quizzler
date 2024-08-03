//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Swain, Susrut (Cognizant) on 15/10/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    let quiz = [
        Question(text: "A turbocharger provides better fuel efficiency and reduces emission", answer: "True"),
        Question(text: "Quantum particles behave differently when observed", answer: "True"),
        Question(text: "Abraham Lincoln is the first president of US", answer: "False"),
        Question(text: "Dolomites is in Italy", answer: "True"),
        Question(text: "Cristiano Ronaldo is the highest international goal scorer in the history of Football", answer: "True"),
        Question(text: "Titan is the largest moon of Saturn", answer: "True"),
        Question(text: "Power stroke is the second stoke in an IC Engine", answer: "False"),
        Question(text: "Volkswagen is the parent company that owns the brands Bentley, Bugatti, Lamborghini, and Audi", answer: "True"),
        Question(text: "Ganymede is the largest moon in our solar system", answer: "True"),
        Question(text: "The first FIFA World Cup was inaugurated in the yaer 1930", answer: "True"),
        Question(text: "One of the seven natural wonders of the world, the northern lights (aurora borealis) is caused by wind", answer: "False"),
        Question(text: "A Spark Plug is used to ignite the fuel in a Diesel Engine", answer: "False"),
        Question(text: "Sputnik 1 is the first artificial satellite", answer: "True"),
    ]
    
    func getQuestion() -> String {
        return quiz[questionNumber].text
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if (userAnswer == quiz[questionNumber].answer) {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if (questionNumber < quiz.count - 1) {
            questionNumber += 1
        }
        else {
            score = 0
            questionNumber = 0
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1)/Float(quiz.count)
    }
}
