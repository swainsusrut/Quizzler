//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//  ~~ This implementaion follows MVC Design Pattern. ~~

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if (quizBrain.checkAnswer(userAnswer)) {
            sender.backgroundColor = UIColor.systemGreen
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
    }
    
    @objc func UpdateUI() {
        lblQuestion.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        lblScore.text = "Score \(quizBrain.getScore())"
        
        btnTrue.backgroundColor = UIColor.clear
        btnFalse.backgroundColor = UIColor.clear
    }
}

