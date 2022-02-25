//
//  ViewController.swift
//  Quizzler
//
//  Created by Zoltán Gál
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = Quizbrain()
    
    override func viewDidLoad() {
        updateUI()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotIt = quizBrain.checkAnswer(userAnswer)
        
        if userGotIt{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAnswerText()
        answerOne.setTitle(answerChoices[0], for: .normal)
        answerTwo.setTitle(answerChoices[1], for: .normal)
        answerThree.setTitle(answerChoices[2], for: .normal)
            // your code here
            self.answerOne.backgroundColor = UIColor.clear
            self.answerTwo.backgroundColor = UIColor.clear
        self.answerThree.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
}

