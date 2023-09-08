//
//  ViewController.swift
//  Quizzler
//
//  Created by Nawra Alaradi on 04/09/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    var quizBrain = QuizBrain()
    var countCorrect:Int = 0
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
       
        let userAnswer = sender.titleLabel?.text
        let color = quizBrain.checkAnswer(userAnswer!)
        quizBrain.updateCurrentIndex()
        sender.backgroundColor = color
 
      Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score : \(quizBrain.score)"
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
}

